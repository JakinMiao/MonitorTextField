//
//  UITextField+JKTextField.m
//  TestTextField
//
//  Created by Jakin on 2017/10/22.
//  Copyright © 2017年 Jakin. All rights reserved.
//

#import "UITextField+JKTextField.h"
#import <objc/runtime.h>
#import "HYPMethodSwizzling.h"

static char *classNameKey = "classNameKey";
static char *textFieldNameKey = "textFieldNameKey";
static char *editTimesKey = "editTimesKey";
static char *startDateKey = "startDateKey";
static char *endDateKey = "endDateKey";
static char *isOpenMonitorKey = "isOpenMonitorKey";

@implementation UITextField (JKTextField)

- (NSString *)className {
    return objc_getAssociatedObject(self, classNameKey);
}

- (void)setClassName:(NSString *)className {
    objc_setAssociatedObject(self, classNameKey, className, OBJC_ASSOCIATION_COPY);
}

- (NSString *)textFieldName {
    return objc_getAssociatedObject(self, textFieldNameKey);
}

- (void)setTextFieldName:(NSString *)textFieldName {
    objc_setAssociatedObject(self, textFieldNameKey, textFieldName, OBJC_ASSOCIATION_COPY);
}

- (NSInteger)editTimes {
    return [objc_getAssociatedObject(self, editTimesKey) integerValue];
}

- (void)setEditTimes:(NSInteger)editTimes {
    objc_setAssociatedObject(self, editTimesKey, @(editTimes) , OBJC_ASSOCIATION_ASSIGN);
}

- (NSDate *)startDate {
    return objc_getAssociatedObject(self, startDateKey);
}

- (void)setStartDate:(NSDate *)startDate {
    objc_setAssociatedObject(self, startDateKey, startDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDate *)endDate {
    return objc_getAssociatedObject(self, endDateKey);
}

- (void)setEndDate:(NSDate *)endDate {
    objc_setAssociatedObject(self, endDateKey, endDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isOpenMonitor {
    return [objc_getAssociatedObject(self, isOpenMonitorKey) boolValue];
}

- (void)setIsOpenMonitor:(BOOL)isOpenMonitor {
    objc_setAssociatedObject(self, isOpenMonitorKey, @(isOpenMonitor), OBJC_ASSOCIATION_ASSIGN);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SwizzlingMethod([UITextField class], @selector(setDelegate:), @selector(hook_setDelegate:));
    });
}

- (void)hook_setDelegate:(id<UITextFieldDelegate>)delegate {
    [self hook_setDelegate:delegate];
    Class aClass = [delegate class];
    hook_exchangeMethod(aClass, @selector(textFieldShouldBeginEditing:), [self class], @selector(hook_textFieldShouldBeginEditing:));
    
    hook_exchangeMethod(aClass, @selector(textFieldDidBeginEditing:), [self class], @selector(hook_textFieldDidBeginEditing:));
    
    hook_exchangeMethod(aClass, @selector(textFieldShouldEndEditing:), [self class], @selector(hook_textFieldShouldEndEditing:));
    
    hook_exchangeMethod(aClass, @selector(textFieldDidEndEditing:), [self class], @selector(hook_textFieldDidEndEditing:));
    
    hook_exchangeMethod(aClass, @selector(textFieldDidEndEditing:reason:), [self class], @selector(hook_textFieldDidEndEditing:reason:));
    
    hook_exchangeMethod(aClass, @selector(textField:shouldChangeCharactersInRange:replacementString:), [self class], @selector(hook_textField:shouldChangeCharactersInRange:replacementString:));
    
    hook_exchangeMethod(aClass, @selector(textFieldShouldClear:), [self class], @selector(hook_textFieldShouldClear:));
    
    hook_exchangeMethod(aClass, @selector(textFieldShouldReturn:), [self class], @selector(hook_textFieldShouldReturn:));
}

- (BOOL)hook_textFieldShouldBeginEditing:(UITextField *)textField {
    printf("hook_textFieldShouldBeginEditing\n");
    return [self hook_textFieldShouldBeginEditing:textField ];
}

- (void)hook_textFieldDidBeginEditing:(UITextField *)textField {
    printf("hook_textFieldDidBeginEditing\n");
    return [self hook_textFieldDidBeginEditing:textField];
}

- (BOOL)hook_textFieldShouldEndEditing:(UITextField *)textField {
    printf("hook_textFieldShouldEndEditing\n");
    return [self hook_textFieldShouldEndEditing:textField];
}

- (void)hook_textFieldDidEndEditing:(UITextField *)textField {
    printf("hook_textFieldDidEndEditing\n");
    return [self hook_textFieldDidEndEditing:textField];
}

- (void)hook_textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    return [self hook_textFieldDidEndEditing:textField reason:reason];
}

- (BOOL)hook_textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    printf("shouldChangeCharactersInRange\n");
    return [self hook_textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (BOOL)hook_textFieldShouldClear:(UITextField *)textField {
    printf("hook_textFieldShouldClear\n");
    return [self hook_textFieldShouldClear:textField];
}

- (BOOL)hook_textFieldShouldReturn:(UITextField *)textField {
    printf("hook_textFieldShouldReturn\n");
    return [self hook_textFieldShouldReturn:textField];
}
@end
