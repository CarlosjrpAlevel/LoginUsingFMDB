//
//  ViewController.h
//  LoginUsingFMDB
//
//  Created by Carlos Reinoso on 12/03/2014.
//  Copyright (c) 2014 Carlos Reinoso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

- (IBAction)loginbutton:(id)sender;

@end
