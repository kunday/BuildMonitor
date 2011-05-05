#import <UIKit/UIKit.h>
#import "Server.h"
#import "AddServerViewController.h"

@interface ServersViewController : UITableViewController {
    NSMutableArray *servers;
}
@property (nonatomic, retain) NSMutableArray *servers;
- (id) initWithTabBar;
- (void)showAddServerView;
@end
