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

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
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
  if ([sender isOn]) {
    _heighMeasureType.text  = @"cm";
    _weightMeasureType.text = @"kg";
  } else {
    _heighMeasureType.text  = @"in";
    _weightMeasureType.text = @"lbs";
  }
}

- (IBAction)calculateBMI:(id)sender {
  float h = [_height.text floatValue];
  float w = [_weight.text floatValue];
  float result = (w/((h*h)/1000));
  _response.text = [[[NSNumber numberWithFloat:result] stringValue] retain];
  //[self checkCategory:result];
}

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
