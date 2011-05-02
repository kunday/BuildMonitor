//
//  CCTrayParser.h
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXMLDocument.h"
#import "CXMLElement.h"
#import "Project.h"

@interface CCTrayParser : NSObject {
    NSString *url;
}

@property (nonatomic, retain) NSString *url;
- (NSMutableArray *) parse;
@end
