//
//  SWViewController.h
//  SWPickerPopoverExample
//
//  Created by Spencer Williams on 12/19/12.
//  Copyright (c) 2012 Spencer Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWPickerPopoverDelegate.h"

@interface SWViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, SWPickerPopoverDelegate>
@property (strong, nonatomic) IBOutlet UIButton *spawnButton;
- (IBAction)spawnButtonPressed:(id)sender;
@end
