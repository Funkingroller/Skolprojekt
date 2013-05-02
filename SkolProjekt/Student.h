//
//  Student.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Admin;
@class DBconnection;

@interface Student : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *idNumber;




-(id)initWithFirstName:(NSString *) firstName
             lastName:(NSString *) lastName
             idNumber:(NSString *) idNumber;

-(id) jsonValue;

-(NSArray *) serializeStudentToJson:(id) objects;

-(id) studentGetMessage:(Admin *) message;

-(id) allStudentsGetMessage:(Admin *) message;


@end
