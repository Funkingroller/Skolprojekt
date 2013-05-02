//
//  DBconnection.m
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import "DBconnection.h"
#import "Student.h"
#import "Course.h"
#import "Admin.h"

@implementation DBconnection

-(void) saveStudentToDb:(Student *) student
{
    NSData *asData = [NSJSONSerialization dataWithJSONObject:student.jsonValue
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    NSString *myString = [[NSString alloc] initWithData:asData
                                               encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/student_db"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];

    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];

    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];
}

-(void) getStudentFromDb:(Student *) student
{
    
    NSData *asData = [NSJSONSerialization dataWithJSONObject:student.jsonValue
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    NSString *myString = [[NSString alloc] initWithData:asData
                                               encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/student_db"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];
 
    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];

    NSLog(@"Student:%@", [[NSString alloc]initWithData:asData encoding:NSUTF8StringEncoding]);
}

-(void) saveCourseToDb:(Course *) course
{
    
    NSData *asData = [NSJSONSerialization dataWithJSONObject:course.jsonValue
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    NSString *myString = [[NSString alloc]
                          initWithData:asData
                          encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/course_db"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];

    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];
}

-(id) getCourseFromDb:(Course *) course
{
    NSData *asData = [NSJSONSerialization dataWithJSONObject:course.jsonValue
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    NSString *myString = [[NSString alloc]
                          initWithData:asData
                          encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/course_db/_id"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];

    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];

    NSLog(@"Course:%@", [[NSString alloc]initWithData:asData
                                             encoding:NSUTF8StringEncoding]);
    
    return asData;
}

-(void) saveMessageToDb:(Admin *) message
{
    NSData *asData = [NSJSONSerialization dataWithJSONObject:message.jsonValue
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    NSString *myString = [[NSString alloc] initWithData:asData
                                               encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/message_db"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];

    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];
}

@end
