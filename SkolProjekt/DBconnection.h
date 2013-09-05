//
//  DBconnection.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//
//  http://funking.iriscouch.com/_utils/
//
//  Logga in med användare: admin    lösen: admin
//

#import <Foundation/Foundation.h>
@class Student;                                                     // Refererar till metoder i header-filen
@class Course;
@class Admin;
@class Schema;

@interface DBconnection : NSObject

-(void) saveStudentToDb:(Student *) student;                        // Spara student till DB (POST)

-(void) getStudentFromDb:(Student *)student;                        // Hämta student från DB (GET)

- (NSString *) getStudentFromDbStr:(NSString *) url;

-(void) saveCourseToDb:(Course *) course;                            // Spara klass till DB

-(id) getCourseFromDb:(Course *) course;                            // Hämta klass från DB

-(void) saveMessageToDb:(Admin *) message;                          // Spara meddelande till DB

@end
