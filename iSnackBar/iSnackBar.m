//
//  iSnackBar.m
//  iSnackBar
//
//  Created by Mahdi Boukhris on 12/12/2017.
//  Copyright © 2017 MB Apps. All rights reserved.
//

#import "iSnackBar.h"

static iSnackBar *currentlyVisibleSnackbar					=	nil;
static NSTimer* dismissalTimer								=	nil;
static id selectionDelegate									=	nil;

@implementation iSnackBar

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}

+ (void) snackBarWithMessage:(NSString*) message {
	[iSnackBar snackBarWithMessage:message font:nil backgroundColor:nil textColor:nil duration:0];
}

+ (void) snackBarWithMessage:(NSString*) message
						font:(UIFont*) font
			 backgroundColor:(UIColor*) bgColor
				   textColor:(UIColor*) textColor
					duration:(float) duration {
	UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
	while (topController.presentedViewController) {
		topController = topController.presentedViewController;
	}
	
	UIView *parentView = topController.view;
	
	if(currentlyVisibleSnackbar) {
		[currentlyVisibleSnackbar removeFromSuperview];
		currentlyVisibleSnackbar			=	nil;
		[dismissalTimer invalidate];
	}

	currentlyVisibleSnackbar				=	[[iSnackBar alloc] initWithFrame:CGRectZero];
	currentlyVisibleSnackbar.translatesAutoresizingMaskIntoConstraints = NO;

	UILabel* mMessageLabel			=	[[UILabel alloc] init];
	[mMessageLabel setNumberOfLines:0];
	[mMessageLabel setText:message];
	
	if(!bgColor) {
		bgColor				=	[UIColor blackColor];
	}
	
	if(!textColor) {
		textColor			=	[UIColor whiteColor];
	}
	
	if(!font) {
		font				=	[UIFont systemFontOfSize:13.f];
	}
	
	[currentlyVisibleSnackbar setBackgroundColor:bgColor];
	[mMessageLabel setTextColor:textColor];
	[mMessageLabel setFont:font];
	
	[currentlyVisibleSnackbar addSubview:mMessageLabel];
	[parentView addSubview:currentlyVisibleSnackbar];
	
	[currentlyVisibleSnackbar setFrame:CGRectMake(0, parentView.frame.size.height, parentView.frame.size.width, 60)];
	[mMessageLabel setFrame:CGRectMake(8, 8, parentView.frame.size.width - 16, 0)];
	[mMessageLabel sizeToFit];
	[currentlyVisibleSnackbar setFrame:CGRectMake(0, parentView.frame.size.height, parentView.frame.size.width, CGRectGetMaxY(mMessageLabel.frame) + 8)];
	
	[UIView animateWithDuration:0.3 animations:^{
		long snackBarYPosition			=	parentView.frame.size.height - currentlyVisibleSnackbar.frame.size.height;
		[currentlyVisibleSnackbar setFrame:CGRectMake(0, snackBarYPosition, parentView.frame.size.width, CGRectGetMaxY(mMessageLabel.frame) + 8)];
	}];
	
	if(duration == 0) {
		duration = 2; // Default duration
	}
	
	dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:duration
													  target:self
													selector:@selector(dismissSnackBar)
													userInfo:nil
													 repeats:NO];
}

+ (void) snackBarWithMessage:(NSString*) message action:(NSString*) actionName delegate:(id) delegate {
	[iSnackBar snackBarWithMessage:message font:nil backgroundColor:nil textColor:nil action:actionName delegate:delegate duration:0];
}

+ (void) snackBarWithMessage:(NSString*) message
						font:(UIFont*) font
			 backgroundColor:(UIColor*) bgColor
				   textColor:(UIColor*) textColor
					  action:(NSString*) action
					delegate:(id) delegate
					duration:(float) duration {
	UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
	while (topController.presentedViewController) {
		topController = topController.presentedViewController;
	}
	
	UIView *parentView = topController.view;
	
	if(currentlyVisibleSnackbar) {
		[currentlyVisibleSnackbar removeFromSuperview];
		currentlyVisibleSnackbar			=	nil;
		[dismissalTimer invalidate];
	}
	
	selectionDelegate					=	delegate;
	currentlyVisibleSnackbar				=	[[iSnackBar alloc] initWithFrame:CGRectZero];
	currentlyVisibleSnackbar.translatesAutoresizingMaskIntoConstraints = NO;
	
	UILabel* mMessageLabel				=	[[UILabel alloc] init];
	[mMessageLabel setNumberOfLines:0];
	[mMessageLabel setText:message];
	
	UIButton* mActionButton				=	[[UIButton alloc] init];
	[mActionButton setTitle:action forState:UIControlStateNormal];
	[mActionButton addTarget:self action:@selector(didSelectSnackBarActionButton:) forControlEvents:UIControlEventTouchUpInside];
	
	if(!bgColor) {
		bgColor				=	[UIColor blackColor];
	}
	
	if(!textColor) {
		textColor			=	[UIColor whiteColor];
	}
	
	if(!font) {
		font				=	[UIFont systemFontOfSize:13.f];
	}
	
	[currentlyVisibleSnackbar setBackgroundColor:bgColor];
	[mMessageLabel setTextColor:textColor];
	[mMessageLabel setFont:font];
	[mActionButton.titleLabel setFont:font];
	[mActionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[mActionButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
	[mActionButton sizeToFit];
	
	[currentlyVisibleSnackbar addSubview:mMessageLabel];
	[currentlyVisibleSnackbar addSubview:mActionButton];
	[parentView addSubview:currentlyVisibleSnackbar];
	
	long buttonWidth = mActionButton.frame.size.width + 16;
	[mActionButton setFrame:CGRectMake(parentView.frame.size.width - buttonWidth - 8, 0, buttonWidth, mActionButton.frame.size.height)];
	
	[currentlyVisibleSnackbar setFrame:CGRectMake(0, parentView.frame.size.height, parentView.frame.size.width, 60)];
	[mMessageLabel setFrame:CGRectMake(8, 8, CGRectGetMinX(mActionButton.frame) - 16, 0)];
	[mMessageLabel sizeToFit];
	[currentlyVisibleSnackbar setFrame:CGRectMake(0, parentView.frame.size.height, parentView.frame.size.width, CGRectGetMaxY(mMessageLabel.frame) + 8)];
	
	long actionButtonYPosition			=	(currentlyVisibleSnackbar.frame.size.height / 2) - (mActionButton.frame.size.height / 2);
	[mActionButton setFrame:CGRectMake(mActionButton.frame.origin.x, actionButtonYPosition, buttonWidth, mActionButton.frame.size.height)];

	[UIView animateWithDuration:0.3 animations:^{
		long snackBarYPosition			=	parentView.frame.size.height - currentlyVisibleSnackbar.frame.size.height;
		[currentlyVisibleSnackbar setFrame:CGRectMake(0, snackBarYPosition, parentView.frame.size.width, CGRectGetMaxY(mMessageLabel.frame) + 8)];
	}];
	
	if(duration == 0) {
		duration = 2; // Default duration
	}
	
	dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:duration
													  target:self
													selector:@selector(dismissSnackBar)
													userInfo:nil
													 repeats:NO];
}

+ (void) dismissSnackBar {
	UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
	while (topController.presentedViewController) {
		topController = topController.presentedViewController;
	}
	
	UIView *parentView = topController.view;
	
	[UIView animateWithDuration:0.2 animations:^{
		long snackBarYPosition			=	parentView.frame.size.height;
		[currentlyVisibleSnackbar setFrame:CGRectMake(0, snackBarYPosition, currentlyVisibleSnackbar.frame.size.width, currentlyVisibleSnackbar.frame.size.height)];
	} completion:^(BOOL finished) {
		[currentlyVisibleSnackbar removeFromSuperview];
		currentlyVisibleSnackbar			=	nil;
	}];
}

+ (void) didSelectSnackBarActionButton:(UIButton*) sender {
	[iSnackBar dismissSnackBar];
	
	if(selectionDelegate && [selectionDelegate respondsToSelector:@selector(didSelectSnackBarAction)]) {
		[selectionDelegate didSelectSnackBarAction];
	}
}

@end
