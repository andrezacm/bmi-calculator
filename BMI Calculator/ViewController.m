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

bool switchCmOn;

- (void)viewDidLoad {
  [super viewDidLoad];
  switchCmOn = YES;
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
  float tempH = [_height.text floatValue];
  float tempW = [_weight.text floatValue];
  //NSDecimalNumber * tempH = [NSDecimalNumber decimalNumberWithString:_height.text];
  //NSDecimalNumber * tempW = [NSDecimalNumber decimalNumberWithString:_weight.text];
  
  if ([sender isOn]) {
    _heighMeasureType.text  = @"cm";
    _weightMeasureType.text = @"kg";
    //_height.text = [[self inTocm:tempH] stringValue];
    //_weight.text = [[self lbsTokg:tempW] stringValue];
    _height.text = [NSString stringWithFormat:@"%.02f", [self inTocm:tempH]];
    _weight.text = [NSString stringWithFormat:@"%.02f", [self lbsTokg:tempW]];
    switchCmOn = YES;
  } else {
    _heighMeasureType.text  = @"in";
    _weightMeasureType.text = @"lbs";
    //_height.text = [[self cmToin:tempH] stringValue];
    //_weight.text = [[self kgTolbs:tempW] stringValue];
    _height.text = [NSString stringWithFormat:@"%.02f", [self cmToin:tempH]];
    _weight.text = [NSString stringWithFormat:@"%.02f", [self kgTolbs:tempW]];
    switchCmOn = NO;
  }
}

//Calculate BMI
- (IBAction)calculateBMI:(id)sender {
  if (([_height.text length] == 0) || ([_weight.text length] == 0)) {
    return;
  }
  /*NSDecimalNumber * h = [NSDecimalNumber decimalNumberWithString:_height.text];
  NSDecimalNumber * w = [NSDecimalNumber decimalNumberWithString:_weight.text];
  
  if (!switchCmOn) {
    NSDecimalNumber * heightInCm = [self inTocm:h];
    NSDecimalNumber * weightInKg = [self lbsTokg:w];
    h = heightInCm;
    w = weightInKg;
  }
  
  NSDecimalNumber * heightInM = [h decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
  NSDecimalNumber * result = [w decimalNumberByDividingBy:[heightInM decimalNumberByMultiplyingBy:heightInM]];
  _response.text = [result stringValue];
  */
  float h = [_height.text floatValue];
  float w = [_weight.text floatValue];
  
  if (!switchCmOn) {
    float heightInCm = [self inTocm:h];
    float weightInKg = [self lbsTokg:w];
    h = heightInCm;
    w = weightInKg;
  }
  
  float heightInM = (h / 100);
  float result = (w / (heightInM * heightInM));
  _response.text = [NSString stringWithFormat:@"%.02f", result];
  [self checkCategory:result];
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

//convertions
- (float)cmToin:(float)cm{
  return (cm * 0.39);
}

- (float)inTocm:(float)inc{
  return (inc * 2.54);
}

- (float)kgTolbs:(float)kg{
  return (kg * 2.2);
}

- (float)lbsTokg:(float)lbs{
  return (lbs / 2.2);
}

//Change Image and label of response
/*- (void)checkCategory:(NSDecimalNumber *)bmi {
  if (bmi.floatValue < 16){
    _responseCategory.text = @"Severe Thinness";
    [_image setImage:[UIImage imageNamed: @"1.png"]];
  }
  else if (bmi.floatValue <= 16.99){
    _responseCategory.text = @"Moderate Thinness";
    [_image setImage:[UIImage imageNamed: @"2.png"]];
  }
  else if (bmi.floatValue <= 18.49){
    _responseCategory.text = @"Mild Thinness";
    [_image setImage:[UIImage imageNamed: @"3.png"]];
  }
  else if (bmi.floatValue <= 24.99){
    _responseCategory.text = @"Normal Range";
    [_image setImage:[UIImage imageNamed: @"4.png"]];
  }
  else if (bmi.floatValue <= 29.99){
    _responseCategory.text = @"Overweight";
    [_image setImage:[UIImage imageNamed: @"5.png"]];
  }
  else if (bmi.floatValue <= 34.99){
    _responseCategory.text = @"Obese Class I";
    [_image setImage:[UIImage imageNamed: @"6.png"]];
  }
  else if (bmi.floatValue <= 39.99){
    _responseCategory.text = @"Obese Class II";
    [_image setImage:[UIImage imageNamed: @"7.png"]];
  }
  else if (bmi.floatValue > 39.99){
    _responseCategory.text = @"Obese Class III";
    [_image setImage:[UIImage imageNamed: @"8.png"]];
  }
}*/

//convertions
/*- (NSDecimalNumber *)cmToin:(NSDecimalNumber *)cm{
  return [cm decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.39"]];
}

- (NSDecimalNumber *)inTocm:(NSDecimalNumber *)inc{
  return [inc decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"2.54"]];
}

- (NSDecimalNumber *)kgTolbs:(NSDecimalNumber *)kg{
  return [kg decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"2.2"]];
}

- (NSDecimalNumber *)lbsTokg:(NSDecimalNumber *)lbs{
  return [lbs decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"2.2"]];
}*/

@end
