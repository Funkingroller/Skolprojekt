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
        [connection saveStudentToDb:student1];
        [connection saveStudentToDb:student2];
        [connection saveStudentToDb:student3];
        [connection saveStudentToDb:student4];
        
#pragma mark - Hämtar studenter fr db
//        [connection getStudentFromDb:student1];
//        [connection getStudentFromDb:student2];
//        [connection getStudentFromDb:student3];
//        [connection getStudentFromDb:student4];
        
        
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
                                                     when:@"09-15"
                                                classRoom:@"G32"
                                                    notes:@"Läs på om grammatik"
                                           courseStudents:@[student4.firstName, student1.firstName]];

        Course *course3 = [[Course alloc] initWithSubject:@"Fysik"
                                                  teacher:@"Göran Persson"
                                                  weekday:@"Onsdag"
                                                     when:@"12-15"
                                                classRoom:@"A08"
                                                    notes:@"Kroppars rörelser i vakum"
                                           courseStudents:@[student1.firstName, student2.firstName, student3.firstName]];
        
        Course *course4 = [[Course alloc] initWithSubject:@"Dans"
                                                  teacher:@"Tony Irving"
                                                  weekday:@"Torsdag"
                                                     when:@"12-15"
                                                classRoom:@"D01"
                                                    notes:@"Slowfox..."
                                           courseStudents:@[student4.firstName, student1.firstName, student3.firstName]];

        Course *course5 = [[Course alloc] initWithSubject:@"Hemkunskap"
                                                  teacher:@"Bosse 'Bildoktor'"
                                                  weekday:@"Fredag"
                                                     when:@"12-15"
                                                classRoom:@"A08"
                                                    notes:@"Vi ska göra pannkakor..."
                                           courseStudents:@[student1.firstName, student2.firstName, student3.firstName]];
        NSLog(@"\nCourse1 id: %@, \ncourse2 id: %@, \nCourse3 id: %@, \ncourse4 id: %@, \nCourse5 id: %@", course1._id, course2._id, course3._id, course4._id, course5._id);
        
#pragma mark - Sparar kurser till db
        [connection saveCourseToDb:course1];
        [connection saveCourseToDb:course2];
        [connection saveCourseToDb:course3];
        [connection saveCourseToDb:course4];
        [connection saveCourseToDb:course5];
//        NSLog(@"Course: %@ with students:%@", course1.subject, course1.courseStudents);
//        NSLog(@"Course: %@ with students:%@", course2.subject, course2.courseStudents);
//        NSLog(@"Course: %@ with students:%@", course3.subject, course3.courseStudents);
        
//        [connection getCourseFromDb:course1];
//        [connection getCourseFromDb:course2];
//        [connection getCourseFromDb:course3];
//        [connection getCourseFromDb:course4];
//        [connection getCourseFromDb:course5];
        
#pragma mark - Skickar meddelande till en specifik elev
//        Admin *message1 = [[Admin alloc] initWithMessage:@"Nu min snälla Björn måste du fatta./Admin Emma"toStudent:student4];
        
#pragma mark - Skickar meddelande till alla elever
        Admin *message2 = [[Admin alloc] initWithMessageToAll:@"Hej Alla duktiga examinatörer."];
        
//        [connection saveMessageToDb:message1];
//        [connection saveMessageToDb:message2];
//        
//        [student2 studentGetMessage:message1];
////        NSLog(@"Till student: %@, Message:%@", student2.firstName, message1.message);
        
//        [student1 allStudentsGetMessage:message2];
//        [student2 allStudentsGetMessage:message2];
//        [student3 allStudentsGetMessage:message2];
//        [student4 allStudentsGetMessage:message2];
        // NSLog(@"Till student: %@, Message:%@", student1.firstName, message2.message);
        // NSLog(@"Till student: %@, Message:%@", student2.firstName, message2.message);
        // NSLog(@"Till student: %@, Message:%@", student3.firstName, message2.message);
        // NSLog(@"Till student: %@, Message:%@", student4.firstName, message2.message);
        
        
        [[NSRunLoop currentRunLoop] run];
    }

    return 0;
}

