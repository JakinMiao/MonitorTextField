//
//  UITextField+JKTextField.h
//  TestTextField
//
//  Created by Jakin on 2017/10/22.
//  Copyright © 2017年 Jakin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (JKTextField)

/** 记录这个TextField 在哪一个controller里面 */
@property (nonatomic, copy) NSString *className;

/** 记录这个controller里面的指定的TextField */
@property (nonatomic, copy) NSString *textFieldName;

/** 记录这个TextField修改次数 */
@property (nonatomic, assign) NSInteger editTimes;

/** 记录用户聚焦这个输入框的开始时间 */
@property (nonatomic, strong) NSDate *startDate;

/** 记录用户离开这个输入框的结束时间 */
@property (nonatomic, strong) NSDate *endDate;

/** 该输入框是否开启监控 */
@property (nonatomic, assign) BOOL isOpenMonitor;

@end
