//
//  Person.m
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//static instance to implement singleton pattern
static Person * person = nil;

@implementation Person

  @synthesize weight;
  @synthesize height;

+(Person *)initialize {
  if (person == nil) {
    person = [[[self alloc] init] retain];
  }
  return person;
}

-(NSNumber *)bmi {
  float h = height.floatValue;
  float w = weight.floatValue;
  
  if (_measurement == us) {
    float heightInCm = [[self inTocm:h] floatValue];
    float weightInKg = [[self lbsTokg:w] floatValue];
    h = heightInCm;
    w = weightInKg;
  }
  
  float heightInM = (h / 100);
  float bmi = (w / (heightInM * heightInM));
  return [NSNumber numberWithFloat:bmi];
}

-(NSNumber *)height {
  return height;
}

-(NSNumber *)weight {
  return weight;
}

-(void)setHeight:(NSNumber *)h {
  if (height != h) {
    NSNumber * temp = height;
    height = [h retain];
    [temp release];
  }
}

-(void)setWeight:(NSNumber *)w {
  if (weight != w) {
    NSNumber * temp = weight;
    weight = [w retain];
    [temp release];
  }
}

-(void)changeMeasurementToMetric {
  if (_measurement == us) {
    _measurement = metric;
    
    NSNumber * h = height;
    NSNumber * w = weight;
    
    height = [[self inTocm:[h floatValue]] retain];
    weight = [[self lbsTokg:[w floatValue]] retain];
    
    [h release];
    [w release];
  }
}

-(void)changeMeasurementToUS {
  if (_measurement == metric) {
    _measurement = us;
    
    NSNumber * h = height;
    NSNumber * w = weight;
    
    height = [[self cmToin:[h floatValue]] retain];
    weight = [[self kgTolbs:[w floatValue]] retain];
    
    [h release];
    [w release];
  }
}

//convertions
- (NSNumber *)cmToin:(float)cm{
  return [NSNumber numberWithFloat:(cm * 0.3937)];
}

- (NSNumber *)inTocm:(float)inc{
  return [NSNumber numberWithFloat:(inc * 2.54)];
}

- (NSNumber *)kgTolbs:(float)kg{
  return [NSNumber numberWithFloat:(kg * 2.2)];
}

- (NSNumber *)lbsTokg:(float)lbs{
  return [NSNumber numberWithFloat:(lbs / 2.2)];
}

@end