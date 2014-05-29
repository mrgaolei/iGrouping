//
//  WPGConfigViewController.h
//  grouper
//
//  Created by 高磊 on 14-5-29.
//  Copyright (c) 2014年 WholePort. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPGConfigViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label_preGroup;
@property (strong, nonatomic) IBOutlet UILabel *label_groupCount;
@property (strong, nonatomic) IBOutlet UILabel *label_sum;
- (IBAction)modify_perGroup:(UIStepper *)sender;
- (IBAction)modify_groupCount:(UIStepper *)sender;
- (void)updateLabelValue;

@end
