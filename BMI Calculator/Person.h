//
//  Person.h
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//  andreza.cmedeiros@gmail.com
//

enum systemOfMeasurements {metric, us};

@interface Person : NSObject

  @property(retain, nonatomic) NSNumber * weight;
  @property(retain, nonatomic) NSNumber * height;
  @property(readonly) enum systemOfMeasurements measurement;

  +(Person   *)initialize;
  -(NSNumber *)bmi;
  -(NSNumber *)weight;
  -(NSNumber *)height;
  -(void)setHeight:(NSNumber *)h;
  -(void)setWeight:(NSNumber *)w;
  -(void)changeMeasurementToMetric;
  -(void)changeMeasurementToUS;

@end
