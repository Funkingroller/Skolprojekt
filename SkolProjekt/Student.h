//
//  Student.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-05-01.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Admin;                                       // Refererar till metoder i header-filen
@class DBconnection;

@interface Student : NSObject

@property (nonatomic, copy) NSString *firstName;    // Förnamn
@property (nonatomic, copy) NSString *lastName;     // Efternamn
@property (nonatomic, copy) NSString *personId;     // Personnr



-(id)initWithFirstName:(NSString *) firstName       // Initieringsmallen för en student
              lastName:(NSString *) lastName
              personId:(NSString *) personId;


-(id) jsonValue;                                    // JavaScript Object Notation - The JSON format is often used
                                                    // for serializing and transmitting structured data over a
                                                    // network connection. It is used primarily to transmit data
                                                    // between a server and web application, serving as an
                                                    // alternative to XML.

-(NSArray *) serializeStudentToJson:(id) objects;   // serialization is the process of translating data structures
                                                    // or object state into a format that can be stored (for example,
                                                    // in a file or memory buffer, or transmitted across a network
                                                    // connection link) and "resurrected" later in the same or
                                                    // another computer environment.[1] When the resulting series
                                                    // of bits is reread according to the serialization format,
                                                    // it can be used to create a semantically identical clone of
                                                    // the original object.

-(id) studentGetMessage:(Admin *) message;          // Man kan skicka meddelanden till en student om man är av
                                                    // klassen Admin.

-(id) allStudentsGetMessage:(Admin *) message;      // Man kan skicka eddelanden till alla om man är av klassen Admin.

-(void)checkSchemeForDate:(NSDate *) d;

-(void) showLessonsForWeek: (NSString *) weekstring;


@end
