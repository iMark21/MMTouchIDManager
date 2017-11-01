//
//  TouchIDManager.m
//  SmallWorld
//
//  Created by Juan Miguel Marques Morilla on 1/11/17.
//  Copyright © Juan Miguel Marques Morilla. All rights reserved.
//

#import "MMTouchIDManager.h"

@implementation MMTouchIDManager

+ (MMTouchIDManager*)sharedInstance{
    static MMTouchIDManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance =[[self alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Show message if needed method

- (void)presentTouchIdDialogIfNeededWithMessage:(NSString*)message andCompletion:(MMTouchIDManagerCompletionBlock)completion{
    [self availableTouchIDWithCompletion:^(BOOL accessEnabled) {
        if (accessEnabled) {
            [self authenticateByTouchId:message withCompletion:^(BOOL accessEnabled) {
                completion (accessEnabled);
            }];
        }else{
            completion (accessEnabled);
        }
    }];
}

#pragma mark - Hardware methods

- (void)availableTouchIDWithCompletion:(MMTouchIDManagerCompletionBlock)completion{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    completion ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]);
}

- (void)authenticateByTouchId:(NSString*)message withCompletion:(MMTouchIDManagerCompletionBlock)completion{
    LAContext *myContext = [LAContext new];
    myContext.localizedFallbackTitle = @"";
    NSString *myLocalizedReasonString = message;
    [self availableTouchIDWithCompletion:^(BOOL touchIDavailable) {
        if (touchIDavailable) {
            [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError * _Nullable error) {
                completion (success);
            }];
        }else{
            completion (false);
        }
    }];
}

#pragma mark - Configuration methods

#define TOUCH_ID_KEY @"TOUCH_ID_KEY"

- (void)enableTouchID:(BOOL)touchID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:touchID] forKey:TOUCH_ID_KEY];
    [defaults synchronize];
}

- (BOOL)touchIDenabled{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:TOUCH_ID_KEY] boolValue];
}

@end
