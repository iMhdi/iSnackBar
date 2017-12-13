//
//  iSnackBar.h
//  iSnackBar
//
//  Created by Mahdi Boukhris on 12/12/2017.
//  Copyright © 2017 MB Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol iSnackBarSelectionDelegate <NSObject>

- (void) didSelectSnackBarAction;

@end

@interface iSnackBar : UIView

+ (void) snackBarWithMessage:(NSString*) message;
+ (void) snackBarWithMessage:(NSString*) message font:(UIFont*) font backgroundColor:(UIColor*) bgColor textColor:(UIColor*) textColor duration:(float) duration;

+ (void) snackBarWithMessage:(NSString*) message action:(NSString*) actionName delegate:(id) delegate;
+ (void) snackBarWithMessage:(NSString*) message font:(UIFont*) font backgroundColor:(UIColor*) bgColor textColor:(UIColor*) textColor action:(NSString*) action delegate:(id) delegate duration:(float) duration;

@end
