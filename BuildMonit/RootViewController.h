#import <UIKit/UIKit.h>
#import "CCTrayParser.h"
#import "ServersViewController.h"
#import "MKInfoPanel.h"

@interface RootViewController : UITableViewController {
    NSMutableArray *builds;
    NSMutableArray *servers;
}
@property (nonatomic, retain) NSMutableArray *builds;
- (id) initWithTabBar;
- (void) reloadData;
@end
