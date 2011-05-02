//
//  Project.h
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXMLNode.h"
#import "CXMLElement.h"

@interface Build : NSObject {
    NSString *webUrl;
    NSString *name;
    NSString *lastBuildLabel;
    NSString *lastBuildTime;
    NSString *lastBuildStatus;
    NSString *activity;
}

@property (nonatomic, retain) NSString *webUrl, *name, *lastBuildLabel, *lastBuildTime, *lastBuildStatus, *activity;
- (id) initWithXMLNode:(CXMLElement *)element;
@end
