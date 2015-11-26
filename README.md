# VladDrawer

I was looking at several drawer (sidebar) implementation. The leading component for sidebar seems to be MMDrawerController. I found several implementations of it and thought the Hamburger implementation by macbaszii (https://github.com/macbaszii/Hamburger) was the most elegant.

This project is based on it, but provides some explanations and instructions.

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
2. Storyboards
3. MMDrawerController+Storyboard
4. Gestures using BaseViewController
5. Bar buttons that open and close the drawer

#### Opening the project

Once CocoaPods are installed, you'll have to open the project using the new workspace file that's created. This is because the Pods are created in a separate project.

#### Storyboards
Our project leverages several View Controllers shown below. The initial view controller is the entry to our application and is of type `MMDrawerController`. The Drawer View Controller is our drawer (with menus Home and Settings). Then we have two view controllers (First and Second) that represent the Home and Settings screens.

![Storyboard](https://github.com/vcollak/VladDrawer/blob/master/images/storyboard.png)
