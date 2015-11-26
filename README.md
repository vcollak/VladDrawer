# VladDrawer

I was looking at several drawer (sidebar) implementation. The leading component for sidebar seems to be MMDrawerController. I found several implementations of it and thought the Hamburger implementation by macbaszii (https://github.com/macbaszii/Hamburger) was the most elegant.

This project is based on it, but provides some explanations and instructions. The user interface looks like this:

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/drawer.png)

## Configuration and Setup

### CocoaPods
The drawer component we are using (MMDrawerController) is available with CocoaPods. To install it:

1. If you don't already have CocpaPods use this getting started guide: https://guides.cocoapods.org/using/getting-started.html

2. Once installed, create a Podfile in your project directory and place this in it:

  `pod 'MMDrawerController', '~> 0.5.7'`

3. run `pod install` in a directory where the Podfile is located


### Code
There are several things to know to get the drawer working:

1. Opening the project
2. MMDrawerController+Storyboard
3. Storyboards
4. BaseViewController - Gestures and Bar buttons  
5. DrawerViewController - Buttons / links to navigate to First and Second Controllers
6. FirstViewController - Home controller
7. SecondViewController - Settings controller


#### Opening the project

Once CocoaPods are installed, you'll have to open the project using the new workspace file that's created. This is because the Pods are created in a separate project.

#### MMDrawerController+Storyboard
This is a Storyboard segue that defined left, center and right segues. We are only using left and center in this project. Left segue represents the a segue to the drawer. Center segue represents a segue to the center controller such as our FistViewController (Home) and SecondViewController (Settings).

Make sure you import this extension in your project. There is nothing else that needs to be done with this. We will change segues in Storyboards to this segue class.

There is also a Pod for this under CocoaPods, but at the time of writing the Pod uses an older version of the MMDrawerController and not the 0.5.7 version we are using now.



#### Storyboards
Our project leverages several View Controllers shown below. The initial view controller is the entry to our application and is of type `MMDrawerController`. The Drawer View Controller is our drawer (with menus Home and Settings). Then we have two view controllers (First and Second) that represent the Home and Settings screens.

##### Overall storyboard layout
![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/storyboard.png)

##### Drawer Controller
Make sure you define a Storyboard ID for the drawer controller

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/drawer_storyboard_settings.png)

Make sure you give the segue a class and an identifier

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/drawer_segue_settings.png)


##### First Controller (Home)
Make sure you define a Storyboard ID for the first (Home) controller

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/first_vc_storyboard_settings.png)

##### Second Controller (Settings)
Make sure you define a Storyboard ID for the first (Home) controller

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/second_vc_storyboard_settings.png)


#### BaseViewController - Gestures and Bar buttons  

Both the First (Home) and Second (Settings) View Controllers use BaseViewController as a parent. This allows us to handle comment things like gestures and menu taps.

```
#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface FirstViewController : BaseViewController
@end
```

##### Base Controller


```
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
```

> Vlad: I could have created an outlet to menuPressed in each (Forst and Second) View Controllers, but chose to crate the outlet to BaseViewController. This way we only have one method that handles opening and closing for the drawer.

#### DrawerViewController - Buttons / links to navigate to First and Second Controllers

This is is the actual drawer:

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/drawer.png)

DrawerViewController imports MMDrawerController header files. Then in navigates to appropriate controllers using the segue ID we defined under a navigational controller for both the FirstViewController and SecondViewController.


```
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
```

#### FirstViewController & SecondViewController
Both FirstViewController & SecondViewController and clean and simple. They merely inherit the BaseViewController. Nothing else needs to be done apart from creating outlets for their Menu buttons to BaseViewController's menuPressed method.

FirstViewController.h

```
#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface FirstViewController : BaseViewController

@end
```

FirstViewController.m
```
#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
```
