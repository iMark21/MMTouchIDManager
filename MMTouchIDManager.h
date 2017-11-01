//
//  TouchIDManager.h
//  SmallWorld
//
//  Created by Juan Miguel Marques Morilla on 1/11/17.
//  Copyright © Juan Miguel Marques Morilla. All rights reserved.
//

@import Foundation;
@import LocalAuthentication;


typedef void (^MMTouchIDManagerCompletionBlock)(BOOL accessEnabled);


@interface MMTouchIDManager : NSObject

+ (MMTouchIDManager*)sharedInstance;

//Hardware methods
- (void)authenticateByTouchId:(NSString*)message WithCompletion:(TouchIDManagerCompletionBlock)completion;;
- (void)availableTouchIDWithCompletion:(MMTouchIDManagerCompletionBlock)completion;

//Configuration methods
- (void)enableTouchID:(BOOL)touchID;
- (BOOL)touchIDenabled;

@end
