# iSnackBar
[![Version](https://img.shields.io/cocoapods/v/iSnackBar.svg?style=flat)](http://cocoapods.org/pods/iSnackBar)
[![License](https://img.shields.io/cocoapods/l/iSnackBar.svg?style=flat)](http://cocoapods.org/pods/iSnackBar)
[![Platform](https://img.shields.io/cocoapods/p/iSnackBar.svg?style=flat)](http://cocoapods.org/pods/iSnackBar)

## Author

El Mahdi BOUKHRIS, m.boukhris@gmail.com

## About
[Snackbars are a Android UI component](https://material.io/guidelines/components/snackbars-toasts.html#) which present a stylish, actionable alert to the user. Google also uses their own iOS snackbar implementation in some of their iOS apps, such as Gmail.

Snackbar's are useful for presenting a brief message to the user which they can then act on. A common usage pattern is to display a snackbar after a user has performed some destructive action, providing the user with a grace period during which they can undo this action.

## Example Project
The included example project provides a demonstration of iSnackBar. It displays a tableView containing differents usecases for different iSnackBar styles. When an item is selected from the list, the corresponding snackbar is presented.

The list is divided into two sections:

* Notification SnackBar : seleting an item from this sections displays a SnackBar that's meant for notifications only displaying a message.
* Action SnackBar : seleting an item from this sections displays a SnackBar meant to notify and at the same time give the user the option to perform an action by adding a button to the SnackBar

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

This project is available via CocoaPods. In order to install, simply add `"iSnackbar"` to your Podfile. 

You can also integrate iSnackbar manually by downloading iSnackbar.h and iSnackbar.m and adding them to your project.

## Usage

This project contains a single class: `iSnackbar`. 

`iSnackbar` objects cannot be "stacked" on-screen. If you display a snackbar while another is on-screen, the currently shown snackbar will be replaced, and it will act as though it had been dismissed after being on-screen for its configured length of time.

All messages sent to `iSnackbar` objects should be sent from the main thread.

### Creating instances of `iSnackbar`

New snackbar objects can be created using the following methods:

    + (void) snackBarWithMessage:(NSString*) message
    
    + (void) snackBarWithMessage:(NSString*) message
						font:(UIFont*) font
			 backgroundColor:(UIColor*) bgColor
				   textColor:(UIColor*) textColor
					duration:(float) duration
                        
    + (void) snackBarWithMessage:(NSString*) message action:(NSString*) actionName delegate:(id) delegate
    
    + (void) snackBarWithMessage:(NSString*) message
						font:(UIFont*) font
			 backgroundColor:(UIColor*) bgColor
				   textColor:(UIColor*) textColor
					  action:(NSString*) action
					delegate:(id) delegate
					duration:(float) duration

                 
* `message` is the text to be displayed on the snackbar's text label.
* `font` is the font that would be used on the snackbar's text label.
* `bgColor` is the snackbar's background color.
* `textColor` is the color that would be used on the snackbar's text label.
* `duration` is the length of time for which the snackbar should remain on the screen before it is dismissed.
* `actionName` is the text to be displayed on the snackbar's button.
* `delegate` is the delegate that would receive the callback if/when the snackbar's button is clicked.
