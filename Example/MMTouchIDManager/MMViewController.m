//
//  MMViewController.m
//  MMTouchIDManager
//
//  Created by iMark21 on 11/01/2017.
//  Copyright (c) 2017 iMark21. All rights reserved.
//

#import "MMViewController.h"
#import "MMTouchIDManager.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self showTouchIdMessage];
}

#pragma mark - touch id

- (void)showTouchIdMessage{
    [[MMTouchIDManager sharedInstance] presentTouchIdDialogIfNeededWithMessage:@"Do you want to access with to the BEST APP in the world with your Touch id?" andCompletion:^(BOOL accessEnabled) {
        if (accessEnabled) {
            [self showAlertWithMessage:@"Congratulations!!! Your are in!" withRetry:false];
        }else{
            [self showAlertWithMessage:@"Ooops, your are not in!" withRetry:true];
        }
    }];
}

#pragma mark - private methods

- (void)showAlertWithMessage:(NSString*)message withRetry:(BOOL)retry{
    UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Info" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    UIAlertAction* retryAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil];
        [self showTouchIdMessage];
    }];
    if (retry) {
        [alert addAction:retryAction];
    }
    [self presentViewController:alert animated:YES completion:nil];
}

@end
