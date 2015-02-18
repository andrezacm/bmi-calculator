//
//  ViewController.m
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

  @synthesize person;
  bool switchCmOn;

- (void)viewDidLoad {
  [super viewDidLoad];
  switchCmOn = YES;
  // Do any additional setup after loading the view, typically from a nib.
  person = [Person initialize];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// Dismiss keyboard by touching outside
- (void) touchesBegan:(NSSet * )touches withEvent:(UIEvent * )event {
  [[self view] endEditing:YES];
}

- (void)dealloc {
  [_height release];
  [_weight release];
  [_heighMeasureType release];
  [_weightMeasureType release];
  [_response release];
  [_image release];
  [_response release];
  [_image release];
  [_responseCategory release];
  [super dealloc];
}

// Switch labels of measure type of height and weight
- (IBAction)switch:(id)sender {
  [person setHeight:[NSNumber numberWithFloat:[_height.text floatValue]]];
  [person setWeight:[NSNumber numberWithFloat:[_weight.text floatValue]]];
  
  if ([sender isOn]) {
    _heighMeasureType.text  = @"cm";
    _weightMeasureType.text = @"kg";
    [person changeMeasurementToMetric];
    switchCmOn = YES;
  } else {
    _heighMeasureType.text  = @"in";
    _weightMeasureType.text = @"lbs";
    [person changeMeasurementToUS];
    switchCmOn = NO;
  }
  
  _height.text = [NSString stringWithFormat:@"%.02f", [[person height] floatValue]];
  _weight.text = [NSString stringWithFormat:@"%.02f", [[person weight] floatValue]];
}

//Calculate BMI
- (IBAction)calculateBMI:(id)sender {
  if (([_height.text length] == 0) || ([_weight.text length] == 0)) {
    return;
  }
  
  [person setHeight:[NSNumber numberWithFloat:[_height.text floatValue]]];
  [person setWeight:[NSNumber numberWithFloat:[_weight.text floatValue]]];
  
  NSNumber * bmi = [person bmi];
  _response.text = [NSString stringWithFormat:@"%.02f", [bmi floatValue]];
  [self checkCategory:[bmi floatValue]];
}

//Change Image and label of response
- (void)checkCategory:(float)bmi {
  if (bmi < 16){
    _responseCategory.text = @"Severe Thinness";
    [_image setImage:[UIImage imageNamed: @"1.png"]];
  }
  else if (bmi <= 16.99){
    _responseCategory.text = @"Moderate Thinness";
    [_image setImage:[UIImage imageNamed: @"2.png"]];
  }
  else if (bmi <= 18.49){
    _responseCategory.text = @"Mild Thinness";
    [_image setImage:[UIImage imageNamed: @"3.png"]];
  }
  else if (bmi <= 24.99){
    _responseCategory.text = @"Normal Range";
    [_image setImage:[UIImage imageNamed: @"4.png"]];
  }
  else if (bmi <= 29.99){
    _responseCategory.text = @"Overweight";
    [_image setImage:[UIImage imageNamed: @"5.png"]];
  }
  else if (bmi <= 34.99){
    _responseCategory.text = @"Obese Class I";
    [_image setImage:[UIImage imageNamed: @"6.png"]];
  }
  else if (bmi <= 39.99){
    _responseCategory.text = @"Obese Class II";
    [_image setImage:[UIImage imageNamed: @"7.png"]];
  }
  else if (bmi > 39.99){
    _responseCategory.text = @"Obese Class III";
    [_image setImage:[UIImage imageNamed: @"8.png"]];
  }
}

@end
