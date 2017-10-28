//
//  UIImage+image.m
//  iFamily
//
//  Created by Mr.Nut on 16/10/29.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+(instancetype)imageWithOringinalNanme:(NSString*)imageName
{
    UIImage*image = [UIImage imageNamed:imageName];
    
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
