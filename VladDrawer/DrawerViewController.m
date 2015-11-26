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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)homeTapped:(id)sender {
    
    NSString *changingViewControllerIdentifier = @"FirstViewController";
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:changingViewControllerIdentifier];
    if (viewController) {
        [self.mm_drawerController setCenterViewController:viewController withCloseAnimation:YES completion:nil];
    }
}

- (IBAction)settingsTapped:(id)sender {
    
    NSString *changingViewControllerIdentifier = @"SecondViewController";
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:changingViewControllerIdentifier];
    if (viewController) {
        [self.mm_drawerController setCenterViewController:viewController withCloseAnimation:YES completion:nil];
    }
}


@end
