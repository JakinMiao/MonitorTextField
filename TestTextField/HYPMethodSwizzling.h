//
//  HYPMethodSwizzling.h
//  TestTextField
//
//  Created by Jakin on 2017/10/22.
//  Copyright © 2017年 Jakin. All rights reserved.
//

#import <Foundation/Foundation.h>

void SwizzlingMethod(Class c, SEL origSEL, SEL newSEL);
void hook_exchangeMethod(Class originalClass, SEL originalSel, Class replacedClass, SEL replacedSel);
