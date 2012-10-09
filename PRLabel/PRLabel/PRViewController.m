//
//  PRViewController.m
//  PRLabel
//
//  Created by Pietro Rea on 9/16/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "PRViewController.h"
#import "PRLabel.h"

@interface PRViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet PRLabel *dateLabel;
@property (strong, nonatomic) IBOutlet PRLabel *pickerLabel;

@property (strong, nonatomic) UIDatePicker* datePicker;
@property (strong, nonatomic) UIPickerView* namePicker;

@end

@implementation PRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.dateLabel.inputView = self.datePicker;
    self.dateLabel.inputAccessoryView = [self accessoryToolbar];
    
    self.namePicker = [[UIPickerView alloc] init];
    self.namePicker.dataSource = self;
    self.namePicker.delegate = self;
    self.namePicker.showsSelectionIndicator = YES;
    self.pickerLabel.inputView = [self namePicker];
    self.pickerLabel.inputAccessoryView = [self accessoryToolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIPicker data source

#pragma mark - UIPicker data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

#pragma mark - UIPicker delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray* array = @[@"Alan Turing", @"John von Neumann", @"Edsger W. Dijkstra", @"Donald Knuth", @"Brian Kernighan"];
    
    return array[row];
}
#pragma mark - Miscellaneous

- (UIToolbar*)accessoryToolbar
{    
    //Create and configure toolabr that holds "Done button"
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    [toolBar sizeToFit];
    
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                          target:nil
                                          action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(doneButtonPressed)];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    return toolBar;
}

- (void) doneButtonPressed {
    [self.view endEditing:YES];
}

@end
