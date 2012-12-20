//
//  SWPickerPopoverDelegate.h
//
//  Created by Spencer Williams on 12/19/12.
//

#import <Foundation/Foundation.h>

@protocol SWPickerPopoverDelegate <NSObject>
@optional
- (void)pickerPopoverControllerWillDismissWithSuccess:(BOOL)success;
- (void)pickerPopoverControllerDidDismissWithSuccess:(BOOL)success;
- (void)pickerPopoverControllerDidDismissPopover:(UIPopoverController *)popoverController;
@end
