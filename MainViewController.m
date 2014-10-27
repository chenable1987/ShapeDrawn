//
//  MainViewController.m
//  ShapeDrawn
//
//  Created by Jie on 2014-10-27.
//  Copyright (c) 2014 JieChen. All rights reserved.
//

#import "MainViewController.h"
#import "InputViewController.h"

@interface MainViewController ()
{
    NSArray* buttonTexts;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    //do any customization here
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    buttonTexts=[NSArray arrayWithObjects: @"Line", @"Rectangle", @"Oval", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - draw shapes

-(void)drawLineWithStartX:(CGFloat)x1 StartY:(CGFloat)y1 EndX:(CGFloat)x2 EndY:(CGFloat)y2
{
    UIBezierPath* line=[UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(x1,y1)];
    [line addLineToPoint:CGPointMake(x2, y2)];
    CAShapeLayer* shapeLayer=[CAShapeLayer layer];
    shapeLayer.path=[line CGPath];
    shapeLayer.strokeColor=[[UIColor redColor]CGColor];
    shapeLayer.lineWidth=0.6f;
    shapeLayer.fillColor=[[UIColor clearColor]CGColor];
    [self.canvas.layer addSublayer:shapeLayer];
    NSLog(@"line drawn");
}

-(void)drawRectangleWithTop:(CGFloat)top Left:(CGFloat)left Bottom:(CGFloat)bottom Right:(CGFloat)right
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(left, top, right-left, bottom-top)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setPath:bezierPath.CGPath];
    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setLineWidth:0.6f];
    [self.canvas.layer addSublayer:shapeLayer];
    NSLog(@"rect drawn");
}

-(void)drawOvalWithCenterX:(CGFloat)x CenterY:(CGFloat)y RadiusX:(CGFloat)radiusx RadiusY:(CGFloat)radiusy
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x-radiusx, y-radiusy, radiusx*2, radiusy*2)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setPath:bezierPath.CGPath];
    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setLineWidth:0.6f];
    [self.canvas.layer addSublayer:shapeLayer];
    NSLog(@"oval drawn");
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [buttonTexts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"buttonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [buttonTexts objectAtIndex:indexPath.row];
    //[cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
    //[cell.contentView.layer setBorderWidth:1.0f];

    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GoToInputView"]) {
        InputViewController* inputView=[segue destinationViewController];
        NSString* shapeType=[buttonTexts objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        inputView.shapeType=[shapeType copy];
    }
}


#pragma mark - Button actions

- (IBAction)clearButtonPressed:(id)sender
{
    NSInteger total=[self.canvas.layer.sublayers count];
    for (NSInteger i=0;i<total-1;i++) {
        [[self.canvas.layer.sublayers objectAtIndex:total-1-i ] removeFromSuperlayer];
    }
}

//what if empty text field; give the domain and range
-(IBAction)okButtonPressed:(UIStoryboardSegue*) segue
{
    if ([[segue identifier] isEqualToString:@"OkBack"]) {
        InputViewController* inputView=[segue sourceViewController];
        CGFloat firstAttribute=[inputView.firstAttributeField.text floatValue];
        CGFloat secondAttribute=[inputView.secondAttributeField.text floatValue];
        CGFloat thirdAttribute=[inputView.thirdAttributeField.text floatValue];
        CGFloat fourthAttribute=[inputView.fourthAttributeField.text floatValue];
        NSString* shapeType=inputView.shapeType;
        if ([shapeType isEqualToString:@"Line"]){
            [self drawLineWithStartX:firstAttribute StartY:(CGFloat)secondAttribute EndX:(CGFloat)thirdAttribute EndY:fourthAttribute];
        }else if ([shapeType isEqualToString:@"Rectangle"]){
            [self drawRectangleWithTop:firstAttribute Left:secondAttribute Bottom:thirdAttribute Right:fourthAttribute];
        }else if([shapeType isEqualToString:@"Oval"]){
            [self drawOvalWithCenterX:firstAttribute CenterY:secondAttribute RadiusX:thirdAttribute RadiusY:fourthAttribute
             ];
        }
    }
}

-(IBAction)cancelButtonPressed:(UIStoryboardSegue*) segue
{
}


@end
