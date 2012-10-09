//
//  PRLabel.m
//  PRLabel
//
//  Created by Pietro Rea on 9/23/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "PRLabel.h"

@implementation PRLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)isUserInteractionEnabled
{
    return YES;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

# pragma mark - UIResponder overrides

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self becomeFirstResponder];
}

@end
