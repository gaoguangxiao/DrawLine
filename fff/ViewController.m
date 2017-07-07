//
//  ViewController.m
//  fff
//
//  Created by mac on 2017/7/7.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"
static CGFloat width = 70;
@interface ViewController ()
{
    UIScrollView *scrollView;
    UIView *bgView;
    CGFloat www;
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    www = pow(2, 0.5)*7*15*10;
    NSLog(@"%f   %f",pow(2, 0.5)*7,www);
    
    
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(www, www);
    
    
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, www, www)];
    [scrollView addSubview:bgView];
    bgView.layer.borderWidth = 1;
    bgView.clipsToBounds = YES;
//    bgView.layer.borderColor = [UIColor blackColor].CGColor;
    
    UIView *bbb = [[UIView alloc]initWithFrame:CGRectMake(0, 0, www, www)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [bgView addSubview:bbb];
    
    
    for (int i=1; i<16; i++) {
        LineView *views = [[LineView alloc]initWithFrame:bgView.frame];
        views.startPoint = CGPointMake(pow(2, 0.5)*width*i, 0);
        views.endPoint = CGPointMake(0, pow(2, 0.5)*width*i);
        views.color = [UIColor blackColor];
        [views setNeedsDisplay];
        views.backgroundColor = [UIColor clearColor];
        [bgView addSubview:views];
        
        //左上 -> 右下 从右上
        LineView *views1 = [[LineView alloc]initWithFrame:bgView.frame];
        
        views1.startPoint = CGPointMake((www-pow(2, 0.5)*width*i), 0);
        //
        views1.endPoint = CGPointMake(www,pow(2, 0.5)*width*i);
        views1.color = [UIColor blackColor];
        [views1 setNeedsDisplay];
        views1.backgroundColor = [UIColor clearColor];
        [bgView addSubview:views1];
        
        
    }
    
    for (int i=1; i<16; i++) {
        LineView *views = [[LineView alloc]initWithFrame:bgView.frame];
        views.startPoint = CGPointMake(pow(2, 0.5)*width*i, www);
        views.endPoint = CGPointMake(www, pow(2, 0.5)*width*i);
        views.color = [UIColor blackColor];
        [views setNeedsDisplay];
        views.backgroundColor = [UIColor clearColor];
        [bgView addSubview:views];
        
        //左上 -> 右下 从右上
        LineView *views1 = [[LineView alloc]initWithFrame:bgView.frame];
        
        views1.startPoint = CGPointMake(0,pow(2, 0.5)*width*i);
        //
        views1.endPoint = CGPointMake(www - pow(2, 0.5)*width*i,www);
        views1.color = [UIColor blackColor];
        [views1 setNeedsDisplay];
        views1.backgroundColor = [UIColor clearColor];
        [bgView addSubview:views1];
        
        
    }
    
    [self saveImageDocuments:[self capture]];
    
    

}
-(void)saveImageDocuments:(UIImage *)image{
    //拿到图片
    UIImage *imagesave = image;
    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/test.png"];
    
//    NSLog(<#NSString * _Nonnull format, ...#>)
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
}
- (UIImage *)capture{
    UIGraphicsBeginImageContextWithOptions(bgView.bounds.size, bgView.opaque, 0.0);
    [bgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
