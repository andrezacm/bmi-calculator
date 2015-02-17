//
//  ViewController.h
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *height;
@property (retain, nonatomic) IBOutlet UITextField *weight;
@property (retain, nonatomic) IBOutlet UILabel *heighMeasureType;
@property (retain, nonatomic) IBOutlet UILabel *weightMeasureType;
@property (retain, nonatomic) IBOutlet UILabel *response;

- (IBAction)switch:(id)sender;
- (IBAction)calculateBMI:(id)sender;


@end

