//
//  InputViewController.h
//  ShapeDrawn
//
//  Created by Jie on 2014-10-27.
//  Copyright (c) 2014 JieChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputViewController : UIViewController

@property(strong,nonatomic)NSString* shapeType;
@property (weak, nonatomic) IBOutlet UILabel *firstAttributeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondAttributeLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdAttributeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthAttributeLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstAttributeField;
@property (weak, nonatomic) IBOutlet UITextField *secondAttributeField;
@property (weak, nonatomic) IBOutlet UITextField *thirdAttributeField;
@property (weak, nonatomic) IBOutlet UITextField *fourthAttributeField;

@end
