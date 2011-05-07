//
//  BuildStatusCellView.h
//  BuildMonit
//
//  Created by Arvind Kunday on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BuildStatusCellView : UITableViewCell {
    IBOutlet UILabel *buildName;
    IBOutlet UILabel *buildSequence;
    IBOutlet UILabel *buildTime;
    IBOutlet UILabel *buildStatus;
}
@property (nonatomic,retain) IBOutlet UILabel *buildName;
@property (nonatomic,retain) IBOutlet UILabel *buildSequence; 
@property (nonatomic,retain) IBOutlet UILabel *buildTime;
@property (nonatomic,retain) IBOutlet UILabel *buildStatus;
@end
