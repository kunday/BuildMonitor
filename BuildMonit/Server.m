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

+(void) transaction:(UnitOfWork)block {
	[ActiveRecordHelpers performSaveDataOperationWithBlock:^(NSManagedObjectContext *context) {
		block();
	}];				
}

+(void) create:(UnitOfWorkForEvent)block {
	[self transaction:^{
		block([self createEntity]);
	}];
}


@end
