//
//  SWPopoverPickerViewController.m
//
//  Created by Spencer Williams on 12/19/12.
//

#import "SWPickerPopoverViewController.h"

@interface SWPickerPopoverViewController ()
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
@end

@implementation SWPickerPopoverViewController

@synthesize popoverController = _popoverC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setContentSizeForViewInPopover:CGSizeMake(348, 260)];
        [self setPopoverController:[[UIPopoverController alloc] initWithContentViewController:self]];
        [self.popoverController setDelegate:self];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPickerView:nil];
    [self setDoneButton:nil];
    [self setDoneButton:nil];
    [self setCancelButton:nil];
    [self setTitleLabel:nil];
    [self setPopoverController:nil];
    [self setDelegate:nil];
    [super viewDidUnload];
}

#pragma mark - Overrides

- (void)setDelegate:(id<SWPickerPopoverDelegate>)delegate
{
    _delegate = delegate;
    if ([delegate conformsToProtocol:@protocol(UIPickerViewDataSource)]) {
        [self.pickerView setDataSource:(id<UIPickerViewDataSource>)delegate];
    }
    if ([delegate conformsToProtocol:@protocol(UIPickerViewDelegate)]) {
        [self.pickerView setDelegate:(id<UIPickerViewDelegate>)delegate];
    }
}
- (void)setTitle:(NSString *)title forButton:(UIButton *)button
{
    [button setTitle:title forState:UIControlStateNormal|UIControlStateSelected|UIControlStateDisabled|UIControlStateHighlighted];
}
- (IBAction)cancelButtonPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerPopoverControllerWillDismissWithSuccess:)]) [self.delegate pickerPopoverControllerWillDismissWithSuccess:NO];
    [self.popoverController dismissPopoverAnimated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerPopoverControllerDidDismissWithSuccess:)]) [self.delegate pickerPopoverControllerDidDismissWithSuccess:NO];
}
- (IBAction)doneButtonPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerPopoverControllerWillDismissWithSuccess:)]) [self.delegate pickerPopoverControllerWillDismissWithSuccess:YES];
    [self.popoverController dismissPopoverAnimated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerPopoverControllerDidDismissWithSuccess:)]) [self.delegate pickerPopoverControllerDidDismissWithSuccess:YES];
}

#pragma mark - Popover Controller Delegate Protocol

//- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerPopoverControllerDidDismissPopover:)]) [self.delegate pickerPopoverControllerDidDismissPopover:popoverController];
}
@end
