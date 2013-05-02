//
//  DBconnection.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@class Course;
@class Admin;

@interface DBconnection : NSObject

-(void) saveStudentToDb:(Student *) student;

-(void) getStudentFromDb:(Student *)student;

-(void) saveCourseToDb:(Course *)course;

-(id) getCourseFromDb:(Course *) course;

-(void) saveMessageToDb:(Admin *) message;

@end
