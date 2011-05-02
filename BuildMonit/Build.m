//
//  Project.m
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Build.h"


@implementation Build
@synthesize webUrl, name, lastBuildLabel, lastBuildTime, lastBuildStatus, activity;
- (id) initWithXMLNode:(CXMLElement *)element{
    self = [super init];
    if(self != nil) {
        self.webUrl = [[element attributeForName:@"webUrl"] stringValue];
        self.name = [[element attributeForName:@"name"] stringValue];
        self.lastBuildLabel = [[element attributeForName:@"lastBuildLabel"] stringValue];
        self.lastBuildTime = [[element attributeForName:@"lastBuildTime"] stringValue];
        self.lastBuildStatus = [[element attributeForName:@"lastBuildStatus"] stringValue];
        self.activity = [[element attributeForName:@"activity"] stringValue];
    }
    return self;
}
@end
