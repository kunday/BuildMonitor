 //
//  main.m
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [NSManagedObjectContext setDefaultContext:[NSManagedObjectContext context]];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
