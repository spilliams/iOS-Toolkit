//
//  SWViewController.m
//  SWPickerPopoverExample
//
//  Created by Spencer Williams on 12/19/12.
//  Copyright (c) 2012 Spencer Williams. All rights reserved.
//

#import "SWViewController.h"
#import "SWPickerPopoverViewController.h"

@interface SWViewController ()
@property (strong, nonatomic) SWPickerPopoverViewController *pickerVC;
@end

@implementation SWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setPickerVC:[SWPickerPopoverViewController new]];
    
    // the following also sets the pickerVC's pickerView's delegate and dataSource to self
    // (as long as self conforms to UIPickerViewDataSource and UIPickerViewDelegate)
    [self.pickerVC setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spawnButtonPressed:(id)sender {
    CGRect rect = CGRectMake(self.view.frame.size.width * 0.5,
                             self.spawnButton.frame.origin.y + self.spawnButton.frame.size.height * 0.75,
                             1,
                             1);
    [self.pickerVC.popoverController presentPopoverFromRect:rect
                                                     inView:self.view
                                   permittedArrowDirections:UIPopoverArrowDirectionUp
                                                   animated:YES];
}

#pragma mark - Picker Popover Delegate Protocol

- (void)pickerPopoverControllerWillDismissWithSuccess:(BOOL)success
{
    NSLog(@"the picker popover is about to dismiss, and it was %@successful",success ? @"":@"un");
}
- (void)pickerPopoverControllerDidDismissWithSuccess:(BOOL)success
{
    NSLog(@"the picker popover just dismissed, and it was %@successful",success ? @"":@"un");
}
- (void)pickerPopoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"the picker popover controller dismissed the popover");
}

#pragma mark - Picker Data Source Procotol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}

#pragma mark - Picker Delegate Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return @"foo";
    } else {
        return @"bar";
    }
}
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

@end
