//
//  TouchIDManager.h
//  Juan Miguel Marques Morilla
//
//  Created by Juan Miguel Marques Morilla on 1/11/17.
//  Copyright © Juan Miguel Marques Morilla. All rights reserved.
//

@import Foundation;
@import LocalAuthentication;


typedef void (^MMTouchIDManagerCompletionBlock)(BOOL accessEnabled);


@interface MMTouchIDManager : NSObject

+ (MMTouchIDManager*)sharedInstance;

//Present the touch ID dialog if the iDevice is has biometrics touchID
- (void)presentTouchIdDialogIfNeededWithMessage:(NSString*)message andCompletion:(MMTouchIDManagerCompletionBlock)completion;

//Check manually if the iDevice has biometrics touchID
- (void)availableTouchIDWithCompletion:(MMTouchIDManagerCompletionBlock)completion;

//Save in your NSDefaults if the user wants to use or not Biometrics touch ID
- (void)enableTouchID:(BOOL)touchID;
- (BOOL)touchIDenabled;

@end
