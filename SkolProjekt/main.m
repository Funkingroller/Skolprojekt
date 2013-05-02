//
//  main.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"
#import "DBconnection.h"
#import "Admin.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
#pragma mark - Skapar studenter
        Student *student1 = [[Student alloc] initWithFirstName:@"Benny"
                                                      lastName:@"Rull"
                                                      idNumber:@"990809-1212"];
        
        Student *student2 = [[Student alloc] initWithFirstName:@"Leif"
                                                      lastName:@"Petti"
                                                      idNumber:@"121212-0002"];
        
        Student *student3 = [[Student alloc] initWithFirstName:@"Rolf"
                                                      lastName:@"Rallare"
                                                      idNumber:@"400901-4634"];

        Student *student4 = [[Student alloc] initWithFirstName:@"Björn"
                                                      lastName:@"Andersson"
                                                      idNumber:@"760809-4634"];

#pragma mark - Startar kontakt med couchDb
        DBconnection *connection = [[DBconnection alloc] init];
        
#pragma mark - Sparar studenter till db
        // [connection saveStudentToDb:student1];
        // [connection saveStudentToDb:student2];
        // [connection saveStudentToDb:student3];
        
#pragma mark - Hämtar studenter fr db
        [connection getStudentFromDb:student1];
        [connection getStudentFromDb:student2];
        
        
#pragma mark - Skapar kurser
        Course *course1 = [[Course alloc] initWithSubject:@"Matematik"
                                                  teacher:@"Berit Mejer"
                                                  weekday:@"Måndag"
                                                     when:@"10-12"
                                                classRoom:@"B13"
                                                    notes:@"Plugga ekvationer!"
                                           courseStudents:@[student4.firstName, student2.firstName]];
 
        Course *course2 = [[Course alloc] initWithSubject:@"Svenska"
                                                  teacher:@"Zenita Otterud"
                                                  weekday:@"Tisdag"
                                                     when:@"13.30"
                                                classRoom:@"G32"
                                                    notes:@"Läs på om grammatik"
                                           courseStudents:@[student4.firstName, student1.firstName]];

        Course *course3 = [[Course alloc] initWithSubject:@"Fysik"
                                                  teacher:@"Göran Persson"
                                                  weekday:@"Torsdag"
                                                     when:@"14-15"
                                                classRoom:@"A08"
                                                    notes:@"Kroppars rörelser i vakum"
                                           courseStudents:@[student1.firstName, student2.firstName, student3.firstName]];
        
#pragma mark - Sparar kurser till db
        // [connection saveCourseToDb:course1];
        // [connection saveCourseToDb:course2];
        // [connection saveCourseToDb:course3];
        // NSLog(@"Course: %@ with students:%@", course1.subject, course1.courseStudents);
        // NSLog(@"Course: %@ with students:%@", course2.subject, course2.courseStudents);
        // NSLog(@"Course: %@ with students:%@", course3.subject, course3.courseStudents);
        
        [connection getCourseFromDb:course1];
        
#pragma mark - Skickar meddelande till en specifik elev
        Admin *message1 = [[Admin alloc] initWithMessage:@"Nu min snälla Björn måste du fatta./Admin Emma"toStudent:student4];
        
#pragma mark - Skickar meddelande till alla elever
        Admin *message2 = [[Admin alloc] initWithMessageToAll:@"Hej Alla duktiga examinatörer."];
        
        // [connection saveMessageToDb:message1];
        // [connection saveMessageToDb:message2];
        
        [student2 studentGetMessage:message1];
        // NSLog(@"Till student: %@, Message:%@", student2.firstName, message1.message);
        
        [student1 allStudentsGetMessage:message2];
        [student2 allStudentsGetMessage:message2];
        [student3 allStudentsGetMessage:message2];
        // NSLog(@"Till student: %@, Message:%@", student1.firstName, message2.message);
        // NSLog(@"Till student: %@, Message:%@", student2.firstName, message2.message);
        // NSLog(@"Till student: %@, Message:%@", student3.firstName, message2.message);
        
        
        [[NSRunLoop currentRunLoop] run];
    }

    return 0;
}

