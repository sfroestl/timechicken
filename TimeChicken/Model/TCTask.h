//
//  TCTask.h
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCTask : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (nonatomic, assign) BOOL completed;

- (id)initWithTitle:(NSString*)title desc:(NSString*)desc;

@end
