//
//  Admin.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;                                         // Importerar klassen Student
@class Course;                                          // Importerar klassen Course

@interface Admin : NSObject

@property (nonatomic, copy) NSString *message;          // Egenskaper för meddelanden

-(id) initWithMessageToAll:(NSString *) message;        // Meddelanden till alla

-(id) initWithMessage:(NSString *) message              // Meddelande till specifik student
            toStudent:(Student *) student;

-(id)jsonValue;

-(NSArray *) serializeMessageToJson:(id) objects;

@end
