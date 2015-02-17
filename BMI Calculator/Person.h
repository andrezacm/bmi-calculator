//
//  Person.h
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

@interface Person : NSObject

  @property(retain, nonatomic) NSNumber * weight;
  @property(retain, nonatomic) NSNumber * height;
  @property(readonly)          NSNumber * bmi;


  -(NSNumber *)bmi;

@end
