//
//  Admin.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import "Admin.h"
#import "Student.h"
#import "Course.h"
#import "Schema.h"

@implementation Admin

-(id) initWithMessageToAll:(NSString *) message
{
    self.message = message;
    return self;
}


-(id) initWithMessage:(NSString *) message
            toStudent:(Student *) student;
{
    self = [super init];
    if (self) {
        self.message = message;
    }
    return self;
}


-(id) jsonValue
{
    NSMutableDictionary *selfAsJson = [NSMutableDictionary new];
    selfAsJson[@"message"] = self.message;
    
    return selfAsJson;
}


-(NSArray *) serializeMessageToJson:(id) objects
{
    NSMutableArray *result = [NSMutableArray new];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;                                      // Returnerar en NSMutableArray
}

@end
