//
//  InputViewController.m
//  ShapeDrawn
//
//  Created by Jie on 2014-10-27.
//  Copyright (c) 2014 JieChen. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Load different attribute names based on _shapeType
    _msgLabel.text=@"";
    if ([_shapeType isEqualToString:@"Line"]) {
        _firstAttributeLabel.text=@"Start X";
        _secondAttributeLabel.text=@"Start Y";
        _thirdAttributeLabel.text=@"End X";
        _fourthAttributeLabel.text=@"End Y";
        _msgLabel.text=@"Warning: domain of x is 0 - 300 and range of y is 0 - 300. Shapes may go beyond the screen if x or y is larger than 300.";
    }else if ([_shapeType isEqualToString:@"Rectangle"]){
        _firstAttributeLabel.text=@"Top";
        _secondAttributeLabel.text=@"Left";
        _thirdAttributeLabel.text=@"Bottom";
        _fourthAttributeLabel.text=@"Right";
        _msgLabel.numberOfLines=0;
        [_msgLabel sizeToFit];
        _msgLabel.text=@"Warning: by default, the value of top should be larger than the bottom and the value of left should be smaller than the right. Unexpected behavior will be seen if not following the rules.";
        [_msgLabel sizeToFit];
    }else if([_shapeType isEqualToString:@"Oval"]){
        _firstAttributeLabel.text=@"Center X";
        _secondAttributeLabel.text=@"Center Y";
        _thirdAttributeLabel.text=@"Radius X";
        _fourthAttributeLabel.text=@"Radius Y";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/* Dismiss keyboard by touching anywhere on the screen*/
-(IBAction)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_firstAttributeField resignFirstResponder];
    [_secondAttributeField resignFirstResponder];
    [_thirdAttributeField resignFirstResponder];
    [_fourthAttributeField resignFirstResponder];
}



@end
