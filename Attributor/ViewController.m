//
//  ViewController.m
//  Attributor
//
//  Created by Jep Xia on 2017/2/1.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end

@implementation ViewController
- (IBAction)changeBodySelectionColorToMatchBackgroundOfColor:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

- (IBAction)outlineBodySelection:(UIButton *)sender
{
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName : [UIColor blackColor] }
                                   range:self.body.selectedRange];
}

- (IBAction)unoutlineToBodySelection:(UIButton *)sender
{
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
