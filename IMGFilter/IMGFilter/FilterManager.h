//
//  FeilterManager.h
//  IMGFilter
//
//  Created by KingCQ on 2017/1/7.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^imageBlock)(UIImage *image);

@interface FilterManager: NSObject

@property (nonatomic,copy) imageBlock imageBLOCK;

- (UIImage *)createImageWithImage:(UIImage *)inImage
                      colorMatrix:(const float *)f;
- (UIImage *)showImage: (UIImage *)inImage with: (NSArray<NSString *> *)array;
    
@end
