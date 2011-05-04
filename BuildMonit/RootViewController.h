//
//  RootViewController.h
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCTrayParser.h"
#import "AddServerViewController.h"

@interface RootViewController : UITableViewController {
    NSMutableArray *builds;
    NSMutableArray *servers;
}
@property (nonatomic, retain) NSMutableArray *builds;
- (void)showAddServerView;
- (void) reloadData;
@end
