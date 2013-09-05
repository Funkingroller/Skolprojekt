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


-(void) saveStudentToDb:(Student *) student                                             // Spara student till couch
{
    NSData *asData = [NSJSONSerialization dataWithJSONObject:student.jsonValue          // Lägg till student i
                                                                                        // json-format i asData
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
                                                                            /* Returns YES if the given object can be converted to JSON data, NO otherwise. The object must have the following properties:
                                                                            - Top level object is an NSArray or NSDictionary
                                                                            - All objects are NSString, NSNumber, NSArray, NSDictionary, or NSNull
                                                                            - All dictionary keys are NSStrings
                                                                            - NSNumbers are not NaN or infinity
                                                                            Other rules may apply. Calling this method or attempting a conversion are the definitive ways to tell if a given object can be converted to JSON data. */

    
    NSString *myString = [[NSString alloc] initWithData:asData              // Skapa en myString där asData kodas som UTF8
                                               encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://funking.iriscouch.com/student_db"];       // Skapa variabeln url som
                                                                                        // innehåller adressen till db
                                                                                    /* These methods expect their string    arguments to contain any percent escape codes that are necessary. It is an error for URLString to be nil.
                                                                                    */

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url                      
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];       // Skapar request som...
                                                                                    // @method setURL. Abstract Sets the
                                                                                    // URL of the receiver. param URL
                                                                                    // The new URL for the receiver.

    [request setHTTPMethod:@"POST"];                                                // request skickas till...
                                                                                /*! 
                                                                                @method setAllHTTPHeaderFields:
                                                                                @abstract Sets the HTTP header fields 
                                                                                of the receiver to the given
                                                                                dictionary.
                                                                                @discussion This method replaces all 
                                                                                header fields that may have
                                                                                existed before this method call.
                                                                                <p>Since HTTP header fields must be 
                                                                                string values, each object and
                                                                                key in the dictionary passed to this 
                                                                                method must answer YES when
                                                                                sent an <tt>-isKindOfClass:
                                                                                [NSString class]</tt> message. 
                                                                                If either the key or value for a 
                                                                                key-value pair answers NO when sent 
                                                                                this message, the key-value pair is 
                                                                                skipped. @param headerFields a 
                                                                                dictionary containing HTTP header fields.
                                                                                */
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];                                                    // request skickas till...
                                                        /*!
                                                        @method addValue:forHTTPHeaderField:
                                                        @abstract Adds an HTTP header field in the current header
                                                        dictionary.
                                                        @discussion This method provides a way to add values to header
                                                        fields incrementally. If a value was previously set for the given
                                                        header field, the given value is appended to the previously-existing
                                                        value. The appropriate field delimiter, a comma in the case of HTTP,
                                                        is added by the implementation, and should not be added to the given
                                                        value by the caller. Note that, in keeping with the HTTP RFC, HTTP
                                                        header field names are case-insensitive.
                                                        @param value the header field value.
                                                        @param field the header field name (case-insensitive).
                                                        */

    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];            // request skickas till...
                                                        /*!
                                                        @method setHTTPBodyStream:
                                                        @abstract Sets the request body to be the contents of the 
                                                        given stream.
                                                        @discussion The provided stream should be unopened; the request 
                                                        will take over the stream's delegate.  The entire stream's 
                                                        contents will be transmitted as the HTTP body of the request.  
                                                        Note that the body stream and the body data (set by 
                                                        setHTTPBody:, above) are mutually exclusive
                                                         - setting one will clear the other.
                                                        @param inputStream the new input stream for use by the receiver
                                                        */
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];
                                                        /* __used forces variables and functions to be included even if 
                                                        it appears * to the compiler that they are not used (and would 
                                                        thust be discarded).
                                                        */

//    NSLog(@"asdata: %@", asData);
//    NSLog(@"mystring: %@", myString);
//    NSLog(@"request: %@", request);

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
    
    [request setHTTPMethod:@"GET"];                                                     // request begär en GET
    
    [request setValue:@"application/json"
   forHTTPHeaderField:@"Content-type"];
 
    [request setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                          delegate:nil];

    NSLog(@"Student:%@", [[NSString alloc]initWithData:asData encoding:NSUTF8StringEncoding]);
}


- (NSString *) getStudentFromDbStr:(NSString *) url
{                                                                                   // Test
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    url = [NSURL URLWithString:@"http://funking.iriscouch.com/student_db/_id=0052a55aa2628605ab9ae2f26100125a"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    NSLog(@"Data: %@", oResponseData);

    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://funking.iriscouch.com/student_db?_id=0052a55aa2628605ab9ae2f26100125a"];
//    NSData  *data = [NSData dataWithContentsOfURL: url];
//    NSString *ret = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"ret: %@", ret);
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

//    NSLog(@"Course:%@", [[NSString alloc]initWithData:asData
//                                             encoding:NSUTF8StringEncoding]);
    
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
