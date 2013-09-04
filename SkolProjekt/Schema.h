//
//  Schema.h
//  SkolProjekt
//
//  Created by Björn Dyvelcrona on 2013-09-02.
//  Copyright (c) 2013 Björn Dyvelcrona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"
#import "Student.h"

@interface Schema : NSObject



@property (nonatomic, copy) NSMutableArray *allaStudenter;
@property (nonatomic, copy) NSMutableArray *allaKlasser;
@property (nonatomic, copy) NSMutableArray *allaLektioner;


@end
