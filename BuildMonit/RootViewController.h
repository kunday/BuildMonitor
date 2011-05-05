#import <UIKit/UIKit.h>
#import "CCTrayParser.h"
#import "AddServerViewController.h"
#import "ServersViewController.h"

@interface RootViewController : UITableViewController {
    NSMutableArray *builds;
    NSMutableArray *servers;
}
@property (nonatomic, retain) NSMutableArray *builds;
- (id) initWithTabBar;
- (void)showAddServerView;
- (void) reloadData;
@end
