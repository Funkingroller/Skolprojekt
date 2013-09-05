//
//  SkolProjektTests.h
//  SkolProjektTests
//
//  Created by Björn Dyvelcrona on 2013-09-04.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Schema.h"
#import "Student.h"
#import "Course.h"
#import "Admin.h"
#import "DBconnection.h"

@interface SkolProjektTests : SenTestCase
{
    Schema *samling;
    Student *elev;
    Course *kurs;
    Admin *adm;
    DBconnection *couch;
    
}

@end
