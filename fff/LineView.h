//
//  LineView.h
//  fff
//
//  Created by mac on 2017/7/7.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineView : UIView
@property(nonatomic , strong) UIColor *color;
@property(nonatomic , assign) CGPoint startPoint;
@property(nonatomic , assign) CGPoint endPoint;
@end
