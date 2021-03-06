#import "BuildStatusViewController.h"

@implementation BuildStatusViewController
@synthesize builds;

- (id)init{
    self = [super init];
    if (self != nil) {
        builds = [[NSMutableArray alloc] init];
        servers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) initWithTabBar {
    [self init];
    if (self != nil) {
        self.title = @"Builds";
        self.navigationItem.title = @"Build Status";
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadData)];
    [super viewDidLoad];
}

- (void) reloadData {
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    dispatch_queue_t request_queue = dispatch_queue_create("com.kunday.BuildMonit", NULL);
    dispatch_async(request_queue, ^{
        NSFetchRequest *request = [Server requestAll];
        NSArray *localServers = [Server executeFetchRequest:request];
        NSMutableArray *localBuilds = [[NSMutableArray alloc] init];
        int countOfFailedBuilds = 0;
        NSLog(@"%@",localServers);
        for (Server *server in localServers) {
            NSMutableArray *buildArray = [[NSMutableArray alloc] init];
            CCTrayParser *parser = [[CCTrayParser alloc] initWithUrl:server.url];
            for (Build *build in [parser parse]) {
                if (![build.lastBuildStatus isEqualToString:@"Success"]) {
                    countOfFailedBuilds++;
                }
                [buildArray addObject:build];
            }
            [localBuilds addObject:buildArray];
        }
        NSString *buildStatusNotificationString = @"All Builds Passed";
        if(countOfFailedBuilds > 0 ){
            buildStatusNotificationString = [NSString stringWithFormat:@"%d recent builds Failed",countOfFailedBuilds];
        }
        dispatch_async(main_queue, ^{
            [builds removeAllObjects];
            for (NSArray *array in localBuilds) {
                [builds addObject:array];
            }
            [servers removeAllObjects];
            for (Server *server in localServers) {
                [servers addObject:server.name];
            }
            [self.tableView reloadData];
            [MKInfoPanel showPanelInView:self.view 
                                    type:MKInfoPanelTypeInfo 
                                   title:@"Refresh Complete!" 
                                subtitle:buildStatusNotificationString
                               hideAfter:2];
            return ;
        });
    });
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [builds count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[builds objectAtIndex:section] count];
}

-(BuildStatusCellView*)createStoreItemCellFromNib {
	NSArray* nibContents = [[NSBundle mainBundle] loadNibNamed:@"BuildStatusCellView" owner:self options:nil];
	NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
	BuildStatusCellView* cell = nil;
	NSObject* nibItem = nil;
	while ((nibItem = [nibEnumerator nextObject]) != nil) {
        NSLog(@"found some nib items, %@",[nibItem class]);
		if([nibItem isKindOfClass: [BuildStatusCellView class]]) {
			cell = (BuildStatusCellView*)nibItem;
			break;
		}
	}
	return cell;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BuildStatusCellView";
    
    BuildStatusCellView *cell = (BuildStatusCellView *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [self createStoreItemCellFromNib];
    }
    NSMutableArray *buildArray = [builds objectAtIndex:indexPath.section];
    if ([buildArray count]>0) {
        Build *build = [buildArray objectAtIndex:indexPath.row];
        cell.buildName.text = build.name;
        cell.buildSequence.text = build.lastBuildLabel;
        cell.buildStatus.text = build.lastBuildStatus;
        cell.buildTime.text = build.lastBuildTime;
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
     return [servers objectAtIndex:section];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{
    [super dealloc];
}

@end
