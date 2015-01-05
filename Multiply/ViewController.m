//
//  ViewController.m
//  Multiply
//
//  Created by Gabriel Borri de Azevedo on 1/5/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)onSliderSlide:(id)sender
{
    UISlider *multiplierSlider = (UISlider *)sender;
    int sliderValue = (int)roundf(multiplierSlider.value);
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i",sliderValue];
}


- (IBAction)onCalculateButtonPressed:(id)sender {

    NSInteger operand1 = [self.numberTextField.text intValue];
    NSInteger operand2 = [self.multiplierLabel.text intValue];
    NSInteger result;
    UIColor *skyColor;
    skyColor = [[UIColor alloc] initWithRed:(102.0/255.0) green:(204.0/255.0) blue:(255.0/255.0) alpha:1.0];

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        result = operand1 * operand2;
    } else {
        result = operand1 / operand2;
    }
    if (result > 20)
    {
        self.view.backgroundColor = skyColor;
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    if (result % 3 == 0 && result % 5 == 0)
    {
        self.answerLabel.text = @"Fizzbuzz";
    }
    else if (result % 3 == 0) {
        self.answerLabel.text = @"Fizz";
    }
    else if (result % 5 == 0) {
        self.answerLabel.text = @"Buzz";
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat:@"%li", (long)result];
    }
    [self.numberTextField resignFirstResponder];

}

@end
