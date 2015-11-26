//
//  DrawerViewController.m
//  VladDrawer
//
//  Created by Vladimir Collak on 11/25/15.
//  Copyright © 2015 net.collak. All rights reserved.
//


#import <MMDrawerController.h>
#import <UIViewController+MMDrawerController.h>


#import "DrawerViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/** User tapped the Home button on the Drawer */
- (IBAction)homeTapped:(id)sender {
    
    NSString *changingViewControllerIdentifier = @"FirstViewController";
    [self drawerNavigate:changingViewControllerIdentifier];}

/** User tapped the Settings button on the Drawer */
- (IBAction)settingsTapped:(id)sender {
    
    NSString *changingViewControllerIdentifier = @"SecondViewController";
    [self drawerNavigate:changingViewControllerIdentifier];
}

/** Navigate to the appropriate view controller. Make sure you pass the appropriate Storyboard ID to this. */
- (void) drawerNavigate: (NSString *) viewControllerId{
    
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:viewControllerId];
    if (viewController) {
        [self.mm_drawerController setCenterViewController:viewController withCloseAnimation:YES completion:nil];
    }
    
}





@end
