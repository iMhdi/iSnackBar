//
//  ViewController.h
//  iSnackBarExample
//
//  Created by Mahdi Boukhris on 12/12/2017.
//  Copyright © 2017 MB Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iSnackBar.h"

@interface ViewController : UIViewController <iSnackBarSelectionDelegate, UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) NSMutableArray* mDataArray;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end
