//
//  Course.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;

@interface Course : NSObject

@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *weekday;
@property (nonatomic, copy) NSString *when;
@property (nonatomic, copy) NSString *classRoom;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSArray *courseStudents;
@property (nonatomic, copy, readonly) NSString *courseId;

-(id) initWithSubject:(NSString *) subject
              teacher:(NSString *) teacher
              weekday:(NSString *) weekday
                 when:(NSString *) when
            classRoom:(NSString *) classRoom
                notes:(NSString *) notes
       courseStudents:(NSArray *) courseStudents;

-(id) jsonValue;

-(NSArray *) serializeCourseToJson:(id) objects;

@end
