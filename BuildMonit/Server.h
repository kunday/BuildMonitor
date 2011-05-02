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
typedef void (^UnitOfWork)(Server *event);


@interface Server : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * name;
+(void) create:(UnitOfWork) block;
@end
