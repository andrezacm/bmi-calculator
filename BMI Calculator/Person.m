//
//  Person.m
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

  @synthesize weight;
  @synthesize height;

-(NSNumber *)bmi {
  float h   = self.height.floatValue;
  float w   = self.weight.floatValue;
  float bmi = w/(h*h);
  return [NSNumber numberWithFloat:bmi];
}

@end