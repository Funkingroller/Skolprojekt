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

+(id) courseFromJson:(NSDictionary *) courseAsJson
{
    Course *course = [[self alloc]init];
    course.subject = courseAsJson[@"subject"];
    course.teacher = courseAsJson[@"teacher"];
    course.weekday = courseAsJson[@"weekday"];
    course.when = courseAsJson[@"when"];
    course.classRoom = courseAsJson[@"classRoom"];
    course.notes = courseAsJson[@"notes"];
    course.courseStudents = courseAsJson[@"courseStudents"];
    
    return course;
}

-(id) init
{
        return [self initWithSubject:@""
                             teacher:@""
                             weekday:@""
                                when:@""
                           classRoom:@""
                               notes:@""
                      courseStudents:@[]];
}

-(id) initWithSubject:(NSString *)subject
              teacher:(NSString *)teacher
              weekday:(NSString *)weekday
                 when:(NSString *)when
            classRoom:(NSString *)classRoom
                notes:(NSString *)notes
       courseStudents:(NSArray *)courseStudents
{
    self = [super init];
    if (self) {
        self.subject = subject;
        self.teacher = teacher;
        self.weekday = weekday;
        self.when = when;
        self.classRoom = classRoom;
        self.notes = notes;
        self.courseStudents = courseStudents;
        self->_courseId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(id) jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc]init];
    selfAsJson[@"subject"] = self.subject;
    selfAsJson[@"teacher"] = self.teacher;
    selfAsJson[@"weekday"] = self.weekday;
    selfAsJson[@"when"] = self.when;
    selfAsJson[@"classRoom"] = self.classRoom;
    selfAsJson[@"notes"] = self.notes;
    selfAsJson[@"courseStudents"] = self.courseStudents;
    selfAsJson[@"courseId"] = self.courseId;
    
    return selfAsJson;
}

-(NSArray *)serializeCourseToJson:(id)objects
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;                              // returnerar en NSMutableArray
}

@end
