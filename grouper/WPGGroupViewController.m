//
//  WPGGroupViewController.m
//  grouper
//
//  Created by 高磊 on 14-5-29.
//  Copyright (c) 2014年 WholePort. All rights reserved.
//

#import "WPGGroupViewController.h"
#import "WPGQianCell.h"

@interface WPGGroupViewController ()

@end

@implementation WPGGroupViewController
{
    NSMutableArray *opened;
    UIAlertView *alert;
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
    opened = [NSMutableArray array];
    alert = [[UIAlertView alloc] initWithTitle:@"抽签已完成" message:@"是否重新抽签？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新抽签", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)done:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnStart:(id)sender
{
    [alert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.qian.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WPGQianCell *cell = (WPGQianCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    BOOL hidden = YES;
    
    if ([opened containsObject:indexPath]) {
        hidden = NO;
    }
    
    
    [cell.label_qian setHidden:hidden];
    cell.label_qian.text = [self.qian objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    WPGQianCell *cell = (WPGQianCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor brownColor];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    WPGQianCell *cell = (WPGQianCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:.5f green:.64f blue:.33f alpha:1.0f];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (opened.count >= self.qian.count) {
        [self returnStart:self];
        return;
    }
    if ([opened containsObject:indexPath]) {
        return;
    }
    [opened addObject:indexPath];
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    if (opened.count == self.qian.count) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    }

}

@end
