//
//  SWPopoverPickerViewController.h
//
//  Created by Spencer Williams on 12/19/12.
//

#import <UIKit/UIKit.h>
#import "SWPickerPopoverDelegate.h"

@interface SWPickerPopoverViewController : UIViewController <UIPopoverControllerDelegate>

@property (strong, nonatomic) id<SWPickerPopoverDelegate> delegate;
@property (strong, nonatomic) UIPopoverController *popoverController;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

/**
 Sets the specified button's title for control states Normal, Disabled, Highlighted and Selected
 @param title   The desired title
 @param button  The button
 */
- (void)setTitle:(NSString *)title forButton:(UIButton *)button;

@end
