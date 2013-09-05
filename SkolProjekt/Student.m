//
//  Student.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import "Student.h"
@class Course;

@implementation Student

-(id)init                                                                  // Initiera en tom student
{
    return [self initWithFirstName:@"" lastName:@"" personId:@""];
}

-(id)initWithFirstName:(NSString *) firstName                               // Initiera en student med dessa parametrar
              lastName:(NSString *) lastName
              personId:(NSString *) personId
{
    self = [super init];                                                    // self = [super init] is how ObjectiveC
                                                                            // invokes the parent's constructor.
                                                                            // Self is a reference to the current object.
    
    if (self) {                                                             // Kollar att self inte är nil.
        self.firstName = firstName;                                         // Lägg till variablerna.
        self.lastName = lastName;
        self.personId = personId;
;
    }
    return self;                                                            // Returnera sedan objektet.
}

-(id)studentGetMessage:(Admin *) message
{
    return message;
}

-(id)allStudentsGetMessage:(Admin *) message
{
    return message;
}

-(id)jsonValue                                      // En funktion som skapar ett objekt med variabler i Json-format.
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"personId"] = self.personId;
    
    return selfAsJson;                                                      // Den retunerar objektet
}

-(NSArray *)serializeStudentToJson:(id) objects                              // Omvandlar en student till Json.
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;                                                          // returnerar en NSMutableArray
}

@end
