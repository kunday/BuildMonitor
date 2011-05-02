//
//  Server.m
//  BuildMonit
//
//  Created by Arvind Kunday on 03/05/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Server.h"


@implementation Server
@dynamic url;
@dynamic name;

+(void) create:(UnitOfWork)block {
	[ActiveRecordHelpers performSaveDataOperationWithBlock:^(NSManagedObjectContext *context) {
		block([self createEntity]);
	}];				
}
@end
