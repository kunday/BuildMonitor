#import "RootViewController.h"

@implementation RootViewController
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
        NSLog(@"%@",localServers);
        for (Server *server in localServers) {
            NSMutableArray *buildArray = [[NSMutableArray alloc] init];
            CCTrayParser *parser = [[CCTrayParser alloc] initWithUrl:server.url];
            for (Build *build in [parser parse]) {
                [buildArray addObject:build];
            }
            [localBuilds addObject:buildArray];
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
                                subtitle:nil
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    NSMutableArray *buildArray = [builds objectAtIndex:indexPath.section];
    if ([buildArray count]>0) {
        Build *build = [buildArray objectAtIndex:indexPath.row];
        cell.textLabel.text = build.name;
        cell.detailTextLabel.text = build.lastBuildStatus;
    }
    // Configure the cell.
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
