//
//  ViewController.m
//  iSnackBarExample
//
//  Created by Mahdi Boukhris on 12/12/2017.
//  Copyright © 2017 MB Apps. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

#define iSnackBarMessage					@"iSnackBarLib - Example : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self constructData];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.mDataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[self.mDataArray objectAtIndex:section] objectForKey:@"rows"] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView* headerView				=	[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
	UILabel* headerLabel			=	[[UILabel alloc] initWithFrame:CGRectMake(8, 0, self.view.frame.size.width - 16, 30)];
	[headerView setBackgroundColor:[UIColor grayColor]];
	[headerLabel setText:[[self.mDataArray objectAtIndex:section] objectForKey:@"section_name"]];
	[headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12]];
	[headerLabel setTextColor:[UIColor whiteColor]];
	[headerView addSubview:headerLabel];
	return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	TableViewCell* cell			= 	[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
	
	[cell.mCellLabel setText:[[[self.mDataArray objectAtIndex:indexPath.section] objectForKey:@"rows"] objectAtIndex:indexPath.row]];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0) { //Notification iSnackBar
		if(indexPath.row == 0) {
			[iSnackBar snackBarWithMessage:iSnackBarMessage];
		} else if(indexPath.row == 1) {
			[iSnackBar snackBarWithMessage:iSnackBarMessage font:[UIFont fontWithName:@"HelveticaNeue" size:12] backgroundColor:[UIColor redColor] textColor:[UIColor greenColor] duration:3];
		}
	} else if(indexPath.section == 1) { //Action iSnackBar
		if(indexPath.row == 0) {
			[iSnackBar snackBarWithMessage:iSnackBarMessage action:@"Undo" delegate:self];
		} else if(indexPath.row == 1) {
			[iSnackBar snackBarWithMessage:iSnackBarMessage font:[UIFont fontWithName:@"HelveticaNeue" size:12] backgroundColor:[UIColor redColor] textColor:[UIColor greenColor] action:@"Undo" delegate:self duration:3];
		}
	}
}

- (void)didSelectSnackBarAction {
	NSLog(@"Just clicked iSnackBar button");
}

- (void) constructData {
	self.mDataArray					=	[NSMutableArray array];
	
	NSMutableDictionary* dict1		=	[NSMutableDictionary dictionary];
	[dict1 setObject:@"Notification iSnackBar" forKey:@"section_name"];
	[dict1 setObject:[NSMutableArray arrayWithObjects:@"Default notification iSnackBar", @"Custom style notification iSnackBar", nil] forKey:@"rows"];
	
	NSMutableDictionary* dict2		=	[NSMutableDictionary dictionary];
	[dict2 setObject:@"Action iSnackBar" forKey:@"section_name"];
	[dict2 setObject:[NSMutableArray arrayWithObjects:@"Default Action iSnackBar", @"Custom style Action iSnackBar", nil] forKey:@"rows"];
	
	[self.mDataArray addObject:dict1];
	[self.mDataArray addObject:dict2];
}

@end
