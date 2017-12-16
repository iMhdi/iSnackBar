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

/**
 *  Creates and displays a default style notification snackbar.
 *
 *  @param message        The message displayed on the snackbars's text label.
 *
 */
+ (void) snackBarWithMessage:(NSString*) message;

/**
 *  Creates and displays a default style notification snackbar.
 *
 *  @param message        The message displayed on the snackbars's text label.
 *  @param font           The text displayed on the snackbar's action button.
 *  @param bgColor        The duration of time for which the snackbar should remain on the screen.
 *  @param textColor      The color that would be used on the snackbar's text label.
 *  @param duration       The length of time for which the snackbar should remain on the screen before it is dismissed.
 *
 */
+ (void) snackBarWithMessage:(NSString*) message font:(UIFont*) font backgroundColor:(UIColor*) bgColor textColor:(UIColor*) textColor duration:(float) duration;

/**
 *  Creates and displays a default style notification snackbar.
 *
 *  @param message        The message displayed on the snackbars's text label.
 *  @param actionName     The text to be displayed on the snackbar's button.
 *  @param delegate       The delegate that would receive the callback if/when the snackbar's button is clicked.
 *
 */
+ (void) snackBarWithMessage:(NSString*) message action:(NSString*) actionName delegate:(id) delegate;

/**
 *  Creates and displays a default style notification snackbar.
 *
 *  @param message        The message displayed on the snackbars's text label.
 *  @param font           The text displayed on the snackbar's action button.
 *  @param bgColor        The duration of time for which the snackbar should remain on the screen.
 *  @param textColor      The color that would be used on the snackbar's text label.
 *  @param action         The text to be displayed on the snackbar's button.
 *  @param delegate       The delegate that would receive the callback if/when the snackbar's button is clicked.
 *  @param duration       The length of time for which the snackbar should remain on the screen before it is dismissed.
 *
 */
+ (void) snackBarWithMessage:(NSString*) message font:(UIFont*) font backgroundColor:(UIColor*) bgColor textColor:(UIColor*) textColor action:(NSString*) action delegate:(id) delegate duration:(float) duration;

@end
