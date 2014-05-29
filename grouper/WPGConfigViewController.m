//
//  WPGConfigViewController.m
//  grouper
//
//  Created by 高磊 on 14-5-29.
//  Copyright (c) 2014年 WholePort. All rights reserved.
//

#import "WPGConfigViewController.h"
#import "WPGGroupViewController.h"
#import <ArrayUtils.h>

@interface WPGConfigViewController ()

@end

@implementation WPGConfigViewController
{
    NSUInteger perGroup;
    NSUInteger groupCount;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    perGroup = 2;
    groupCount = 4;
    [self updateLabelValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabelValue
{
    self.label_preGroup.text = [NSString stringWithFormat:@"%ld", (long)perGroup];
    self.label_groupCount.text = [NSString stringWithFormat:@"%ld", (long)groupCount];
    self.label_sum.text = [NSString stringWithFormat:@"总人数：%ld", (long)(perGroup * groupCount)];
}

- (IBAction)modify_perGroup:(UIStepper *)sender {
    perGroup = (int)sender.value;
    [self updateLabelValue];
}

- (IBAction)modify_groupCount:(UIStepper *)sender {
    groupCount = (int)sender.value;
    [self updateLabelValue];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue destinationViewController] isMemberOfClass:[WPGGroupViewController class]]) {
        
        NSMutableArray *qian = [NSMutableArray array];
        NSArray *words = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        for (int i = 0; i <= groupCount - 1; i ++) {
            for (int j = 1; j <= perGroup; j ++) {
                [qian addObject:[words objectAtIndex:i]];
            }
        }
        
        WPGGroupViewController *vc = (WPGGroupViewController *)[segue destinationViewController];
        vc.qian = [qian shuffledArray];
    }
}

@end
