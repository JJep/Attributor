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
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end

@implementation ViewController
- (IBAction)changeBodySelectionColorToMatchBackgroundOfColor:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontIsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

- (void) preferredFontIsChanged:(NSNotification *)notification
{
    [self usePreferredFonts];
}

-(void) usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
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



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableAttributedString *title =
        [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title addAttributes:@{NSStrokeWidthAttributeName : @-3,
                           NSStrokeColorAttributeName : self.outlineButton.currentTitleColor}
                   range:NSMakeRange(0, self.outlineButton.currentTitle.length)];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
