//
//  CCTrayParser.m
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCTrayParser.h"


@implementation CCTrayParser
@synthesize url;

- (NSMutableArray *) parse {
    self.url = @"http://localhost:8080/cc.xml";
    NSString *encodedString = (NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef) url, NULL, NULL, kCFStringEncodingUTF8);
    NSURL *requestUrl = [ [NSURL alloc] initWithString:encodedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    CXMLDocument *theXMLDocument = [[[CXMLDocument alloc] initWithData:data options:0 error:&error] autorelease];
    NSArray *theArray = [[theXMLDocument rootElement] elementsForName:@"Project"];
    NSMutableArray *builds = [[NSMutableArray alloc] init];
    for (CXMLElement *element in theArray) {
        Project *project = [[Project alloc] initWithXMLNode:element];
        [builds addObject:project];
    }
    return builds;
}

@end