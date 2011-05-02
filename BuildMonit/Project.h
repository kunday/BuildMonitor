//
//  Project.h
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Project : NSObject {
    NSString *webUrl;
    NSString *name;
    NSString *lastBuildLabel;
    NSString *lastBuildTime;
    NSString *lastBuildStatus;
    NSString *activity;
}

@property (nonatomic, retain) NSString *webUrl, *name, *lastBuildLabel, *lastBuildTime, *lastBuildStatus, *activity;

@end
