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
  float temp = [_height.text floatValue] + [_weight.text floatValue];
  _response.text = [[NSNumber numberWithFloat:temp] stringValue];
}

@end
