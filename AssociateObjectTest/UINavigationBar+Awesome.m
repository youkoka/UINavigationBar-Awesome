//
//  UINavigationBar+Awesome.m
//  AssociateObjectTest
//
//  Created by yehengjia on 2016/4/29.
//  Copyright © 2016年 mitake. All rights reserved.
//

#import "UINavigationBar+Awesome.h"
#import <objc/runtime.h>

@implementation UINavigationBar(Awesome)

static char overlayKey;

-(UIView *) overlay {
    
    return objc_getAssociatedObject(self, &overlayKey);
}

-(void) setOverlay:(UIView *)overlay {
    
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setTitle1 {

//    if(![self overlay]) {
    
        self.topItem.title = @"test1";
//    }
}

-(void) setTitle2 {
    
//    if(![self overlay]) {
    
        self.topItem.title = @"test2";
//    }
}

-(void) setBackgroundImageWithOffset:(CGFloat) offset
{
    if (self.overlay) {
        
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }

    offset -= (self.frame.size.height * 2 + 25);
    
    if (offset >= self.frame.size.height) {
        
        offset = self.frame.size.height;
    }
    
    UIImage *image = [UIImage imageNamed:@"man"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height * 2)];
    
    [view setBackgroundColor:[UIColor redColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    [imageView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 2)];
    
    [view addSubview:imageView];
    
    self.overlay = view;
    
//    self.overlay.layer.anchorPoint = CGPointMake(0.5, 0);
    self.overlay.center = CGPointMake(self.frame.size.width / 2, view.frame.origin.y + offset);
//    self.overlay.transform = CGAffineTransformMakeScale(1, 1 + offset / 100);
    
    [self insertSubview:self.overlay atIndex:0];
}
@end
