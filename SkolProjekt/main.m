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
                                                      personId:@"990809-1212"];
        
        Student *student2 = [[Student alloc] initWithFirstName:@"Leif"
                                                      lastName:@"Petti"
                                                      personId:@"121212-0002"];
        
        Student *student3 = [[Student alloc] initWithFirstName:@"Rolf"
                                                      lastName:@"Rallare"
                                                      personId:@"400901-4634"];

        Student *student4 = [[Student alloc] initWithFirstName:@"Björn"
                                                      lastName:@"Andersson"
                                                      personId:@"760809-4634"];
        

        
#pragma mark - Startar kontakt med couchDb
        DBconnection *connection = [[DBconnection alloc] init];

        
#pragma mark - Sparar studenter till db
//        [connection saveStudentToDb:student1];
//        [connection saveStudentToDb:student2];
//        [connection saveStudentToDb:student3];
//        [connection saveStudentToDb:student4];

        
#pragma mark - Hämtar studenter från db
        [connection getStudentFromDb:student1];
        [connection getStudentFromDb:student2];
        [connection getStudentFromDb:student3];
        [connection getStudentFromDb:student4];
        
        
#pragma mark - Skapar kurser
        Course *course1 = [[Course alloc] initWithSubject:@"Matematik"
                                                  teacher:@"Berit Mejer"
                                                dateStart:[[NSDate alloc] initWithString:@"2013-09-10 10:00:00 +0000"]
                                                 dateSlut:[[NSDate alloc] initWithString:@"2013-09-10 11:00:00 +0000"]
                                                classRoom:@"B13"
                                                    notes:@"Plugga ekvationer!"
                                           courseStudents:@[student4.firstName, student2.firstName]];
 
        Course *course2 = [[Course alloc] initWithSubject:@"Svenska"
                                                  teacher:@"Zenita Otterud"
                                                dateStart:[[NSDate alloc] initWithString:@"2013-08-10 10:00:00 +0000"]
                                                 dateSlut:[[NSDate alloc] initWithString:@"2013-08-10 12:00:00 +0000"]
                                                classRoom:@"G32"
                                                    notes:@"Läs på om grammatik"
                                           courseStudents:@[student4.firstName, student1.firstName]];

        Course *course3 = [[Course alloc] initWithSubject:@"Fysik"
                                                  teacher:@"Göran Persson"
                                                dateStart:[[NSDate alloc] initWithString:@"2013-08-11 10:00:00 +0000"]
                                                 dateSlut:[[NSDate alloc] initWithString:@"2013-08-11 12:00:00 +0000"]
                                                classRoom:@"A08"
                                                    notes:@"Kroppars rörelser i vakum"
                                           courseStudents:@[student1.firstName, student2.firstName, student3.firstName]];
        
        Course *course4 = [[Course alloc] initWithSubject:@"Dans"
                                                  teacher:@"Tony Irving"
                                                dateStart:[[NSDate alloc] initWithString:@"2013-09-11 10:00:00 +0000"]
                                                 dateSlut:[[NSDate alloc] initWithString:@"2013-09-11 12:00:00 +0000"]
                                                classRoom:@"D01"
                                                    notes:@"Slowfox..."
                                           courseStudents:@[student4.firstName, student1.firstName, student3.firstName]];

        Course *course5 = [[Course alloc] initWithSubject:@"Hemkunskap"
                                                  teacher:@"Bosse 'Bildoktor'"
                                                dateStart:[[NSDate alloc] initWithString:@"2013-10-11 10:00:00 +0000"]
                                                 dateSlut:[[NSDate alloc] initWithString:@"2013-10-11 12:00:00 +0000"]
                                                classRoom:@"A08"
                                                    notes:@"Vi ska göra pannkakor..."
                                           courseStudents:@[student1.firstName, student2.firstName, student3.firstName]];


#pragma mark - Gör en array av alla kurser        
NSMutableArray *allCourses = [NSMutableArray new];
                                      [allCourses addObject:course1];
                                      [allCourses addObject:course2];
                                      [allCourses addObject:course3];
                                      [allCourses addObject:course4];
                                      [allCourses addObject:course5];


#pragma mark - Alla kurser en vecka
        NSString *weekstring = [[NSString alloc]init];
        weekstring = @"37";
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat: @"w"];
        NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
        [dayFormatter setDateFormat: @"EEEE"];
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat: @"HH.mm"];
        NSDate *checkdate = [weekFormatter dateFromString:weekstring];
        NSLog(@"%@ %@", weekstring, checkdate);
        for (Course *course in allCourses)
        {
            NSString *d = [weekFormatter stringFromDate:course.dateStart];
            NSString *dag = [dayFormatter stringFromDate:course.dateStart];
            NSString *start = [timeFormatter stringFromDate:course.dateStart];
            NSString *slut = [timeFormatter stringFromDate:course.dateSlut];
            if ([weekstring isEqualToString:d]) {
                NSLog(@"\n \nVecka: %@ \n Lektion: %@ \n Lärare: %@ \n Dag: %@ \n Lektionstid: %@ - %@ \n",d ,course.subject, course.teacher, dag, start, slut);
            }
        }
        
#pragma mark - Alla kurser en vecka för en student
//        NSString *weekstringStudent = [[NSString alloc]init];
//        weekstringStudent = @"37";
////        NSString *perId = @"400901-4634";
//        NSDate *checkdateStudent = [weekFormatter dateFromString:weekstringStudent];
//        NSLog(@"%@ %@", weekstringStudent, checkdateStudent);
//        for (Course *course in allCourses)
//        {
//                //            perId = course.courseStudents;
//                NSString *d = [weekFormatter stringFromDate:course.dateStart];
//                NSString *dag = [dayFormatter stringFromDate:course.dateStart];
//                NSString *start = [timeFormatter stringFromDate:course.dateStart];
//                NSString *slut = [timeFormatter stringFromDate:course.dateSlut];
//                if ([weekstring isEqualToString:d]) {
//                    for (Course *courseStudents in course) {
////                        if ([weekstring isEqualToString:d] && [weekstringStudent isEqualToString:courseStudents]) {
//                        NSLog(@"%@", courseStudents);
//                    NSLog(@"\n \nStudent: %@ \n Vecka: %@ \n Lektion: %@ \n Lärare: %@ \n Dag: %@ \n Lektionstid: %@ - %@ \n",course.courseStudents, d ,course.subject, course.teacher, dag, start, slut);
//                    }
//                    }
//
//            }
//        



                                      
#pragma mark - Skriver ut inlagda kurser        
        NSLog(@"\n\n\n    Course1 id:   %@ \n       Lektion:   %@ \n        Lärare:   %@ \n Lektionsstart:   %@ \n  Lektionsslut:   %@ \n           Sal:   %@ \n      Aktuellt:   %@ \n %@ \n\n    Course2 id:   %@ \n       Lektion:   %@ \n        Lärare:   %@ \n Lektionsstart:   %@ \n  Lektionsslut:   %@ \n           Sal:   %@ \n      Aktuellt:   %@ \n %@ \n\n    Course3 id:   %@ \n       Lektion:   %@ \n        Lärare:   %@ \n Lektionsstart:   %@ \n  Lektionsslut:   %@ \n           Sal:   %@ \n      Aktuellt:   %@ \n %@ \n\n    Course4 id:   %@ \n       Lektion:   %@ \n        Lärare:   %@ \n Lektionsstart:   %@ \n  Lektionsslut:   %@ \n           Sal:   %@ \n      Aktuellt:   %@ \n %@ \n\n    Course5 id:   %@ \n       Lektion:   %@ \n        Lärare:   %@ \n Lektionsstart:   %@ \n  Lektionsslut:   %@ \n           Sal:   %@ \n      Aktuellt:   %@ \n %@  \n\n\n",
              course1._id,
              course1.subject,
              course1.teacher,
              course1.dateStart,
              course1.dateSlut,
              course1.classRoom,
              course1.notes,
              course1.courseStudents,
              course2._id,
              course2.subject,
              course2.teacher,
              course2.dateStart,
              course2.dateSlut,
              course2.classRoom,
              course2.notes,
              course2.courseStudents,
              course3._id,
              course3.subject,
              course3.teacher,
              course3.dateStart,
              course3.dateSlut,
              course3.classRoom,
              course3.notes,
              course3.courseStudents,
              course4._id,
              course4.subject,
              course4.teacher,
              course4.dateStart,
              course4.dateSlut,
              course4.classRoom,
              course4.notes,
              course4.courseStudents,
              course5._id,
              course5.subject,
              course5.teacher,
              course5.dateStart,
              course5.dateSlut,
              course5.classRoom,
              course5.notes,
              course5.courseStudents);
        
        
        

#pragma mark - Sparar kurser till db
//        [connection saveCourseToDb:course1];
//        [connection saveCourseToDb:course2];
//        [connection saveCourseToDb:course3];
//        [connection saveCourseToDb:course4];
//        [connection saveCourseToDb:course5];

//        NSLog(@"Kurs: %@ med studenter:%@", course1.subject, course1.courseStudents);
//        NSLog(@"Kurs: %@ med studenter:%@", course2.subject, course2.courseStudents);
//        NSLog(@"Kurs: %@ med studenter:%@", course3.subject, course3.courseStudents);
        
        
#pragma mark - Hämtar kurs från db
        [connection getCourseFromDb:course1];
        [connection getCourseFromDb:course2];
        [connection getCourseFromDb:course3];
        [connection getCourseFromDb:course4];
        [connection getCourseFromDb:course5];
        

        
#pragma mark - Skickar meddelande till en specifik elev
        Admin *message1 = [[Admin alloc] initWithMessage:@"Nu min snälla Björn måste du fatta./Admin Emma"
                                               toStudent:student4];

        
#pragma mark - Skickar meddelande till alla elever
        Admin *message2 = [[Admin alloc] initWithMessageToAll:@"Hej Alla duktiga examinatörer."];
        
//        [connection saveMessageToDb:message1];
//        [connection saveMessageToDb:message2];
        
        [student2 studentGetMessage:message1];
//        NSLog(@"Till student: %@, Message:%@", student2.firstName, message1.message);
        
        [student1 allStudentsGetMessage:message2];
        [student2 allStudentsGetMessage:message2];
        [student3 allStudentsGetMessage:message2];
        [student4 allStudentsGetMessage:message2];
//        NSLog(@"Till student: %@, Message:%@", student1.firstName, message2.message);
//        NSLog(@"Till student: %@, Message:%@", student2.firstName, message2.message);
//        NSLog(@"Till student: %@, Message:%@", student3.firstName, message2.message);
//        NSLog(@"Till student: %@, Message:%@", student4.firstName, message2.message);
        
        [[NSRunLoop currentRunLoop] run];
    }

    return 0;
}



