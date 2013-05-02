//
//  Student.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id) init
{
    return [self initWithFirstName:@"" lastName:@"" idNumber:@""];
}

-(id)initWithFirstName:(NSString *) firstName
            lastName:(NSString *) lastName
             idNumber:(NSString *) idNumber
{
    self = [super init];
    
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.idNumber = idNumber;
        
    }
    return self;
}

-(id)studentGetMessage:(Admin *)message
{
    return message;
}

-(id)allStudentsGetMessage:(Admin *)message
{
    return message;
}

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"idNumber"] = self.idNumber;
    
    return selfAsJson;
}

-(NSArray *)serializeStudentToJson:(id)objects
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;                              // returnerar en NSMutableArray
}



@end
