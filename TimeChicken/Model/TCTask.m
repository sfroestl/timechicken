//
//  TCTask.m
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import "TCTask.h"

@implementation TCTask

@synthesize title = _title;
@synthesize desc = _desc;

- (id)initWithTitle:(NSString*)title desc:(NSString*)desc {
    if ((self = [super init])) {
        self.title = title;
        self.desc = desc;
    }
    return self;
}

@end