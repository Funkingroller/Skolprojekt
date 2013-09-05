//
//  Course.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import "Course.h"
#import "Student.h"

@implementation Course

+(id) courseFromJson:(NSDictionary *) courseAsJson                      // En klassmetod som sparar en kurs från Json
{
    Course *course = [[self alloc]init];
    course.subject = courseAsJson[@"subject"];
    course.teacher = courseAsJson[@"teacher"];
    course.dateStart = courseAsJson[@"dateStart"];
    course.dateSlut = courseAsJson[@"dateSlut"];
    course.classRoom = courseAsJson[@"classRoom"];
    course.notes = courseAsJson[@"notes"];
    course.courseStudents = courseAsJson[@"courseStudents"];
    
    return course;
}

-(id) init
{
    NSString *subject = [NSString new];
    NSString *teacher = [NSString new];
    NSDate *dateStart = [NSDate new];
    NSDate *dateSlut = [NSDate new];
    NSString *classRoom = [NSString new];
    NSString *notes = [NSString new];
    NSMutableArray *courseStudents = [NSMutableArray new];
    
        return [self initWithSubject:subject
                             teacher:teacher
                           dateStart:dateStart
                            dateSlut:dateSlut
                           classRoom:classRoom
                               notes:notes
                      courseStudents:courseStudents];
}


-(id) initWithSubject:(NSString *)subject
              teacher:(NSString *)teacher
            dateStart:(NSDate *)dateStart
             dateSlut:(NSDate *)dateSlut
            classRoom:(NSString *)classRoom
                notes:(NSString *)notes
       courseStudents:(NSArray *)courseStudents
{
    self = [super init];
    if (self) {
        self.subject = subject;
        self.teacher = teacher;
        self.dateStart = dateStart;
        self.dateSlut = dateSlut;
        self.classRoom = classRoom;
        self.notes = notes;
        self.courseStudents = courseStudents;
        self->__id = [[NSUUID UUID] UUIDString];                 // Skapar ett id som har samma variabelnamn som id i couch
    }
    return self;
}

-(id) jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc]init];
    selfAsJson[@"subject"] = self.subject;
    selfAsJson[@"teacher"] = self.teacher;
    selfAsJson[@"dateStart"] = [NSString stringWithFormat:@"%@",self.dateStart];
    selfAsJson[@"dateSlut"] = [NSString stringWithFormat:@"%@",self.dateSlut];
    selfAsJson[@"classRoom"] = self.classRoom;
    selfAsJson[@"notes"] = self.notes;
    selfAsJson[@"courseStudents"] = self.courseStudents;
    selfAsJson[@"_id"] = self._id;
    
    return selfAsJson;
}

-(NSArray *)serializeCourseToJson:(id)objects
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;                                                  // returnerar en NSMutableArray
}

-(NSUInteger) hash                                                  // Skapar ett unikt id med hash
{
    return 37 * [self._id hash];
}

-(BOOL)isEqual:(id)other
{
    if (other == self)
    {
        return YES;
    }
    if (other && [other isMemberOfClass:[self class]]) {
        return [[other _id] isEqualToString:self._id];
    }
    return NO;
}

@end
