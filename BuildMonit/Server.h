//
//  Server.h
//  BuildMonit
//
//  Created by Arvind Kunday on 03/05/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class Server;
typedef void (^UnitOfWorkForEvent)(Server *event);
typedef void (^UnitOfWork)();

@interface Server : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * name;
+(void) transaction:(UnitOfWork) block;
+(void) create:(UnitOfWork) block;
@end
