//
//  ViewController.h
//  TestAssessment
//
//  Created by Michael Kavouras on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (int)shouldReturnAPositiveInt;
- (float)shouldReturnANegativeFloat;
- (BOOL)shouldReturnANegativeBool;
- (int)shouldReturnSumOf0To100;

@end

