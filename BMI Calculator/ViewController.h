//
//  ViewController.h
//  BMI Calculator
//
//  Created by Andreza da Costa Medeiros on 2/16/15.
//  Copyright (c) 2015 Andreza da Costa Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *height;
@property (retain, nonatomic) IBOutlet UITextField *weight;
@property (retain, nonatomic) IBOutlet UILabel *heighMeasureType;
@property (retain, nonatomic) IBOutlet UILabel *weightMeasureType;
@property (retain, nonatomic) IBOutlet UILabel *response;
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *responseCategory;

@property (retain) Person * person;

- (IBAction)switch:(id)sender;
- (IBAction)calculateBMI:(id)sender;


@end

