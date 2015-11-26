//
//  BaseViewController.m
//  Hamburger
//
//  Created by Kiattisak Anoochitarom on 2/2/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Enables user to swipe right to open the drawer
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Enables user to swipe left to close the drawer
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
}

/** User tapped on the menu */
- (IBAction)menuPressed:(id)sender {
    
    //toggle  (open or close the drawer
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}


@end
