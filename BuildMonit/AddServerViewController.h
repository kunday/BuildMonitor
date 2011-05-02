//
//  AddServerViewController.h
//  BuildMonit
//
//  Created by Arvind Kunday on 03/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"

@interface AddServerViewController : UIViewController {
    IBOutlet UITextField *name;
    IBOutlet UITextField *url;
}
@property(nonatomic,retain) IBOutlet UITextField *name, *url;
- (IBAction) save;
@end
