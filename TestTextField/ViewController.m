//
//  ViewController.m
//  TestTextField
//
//  Created by Jakin on 2017/10/22.
//  Copyright © 2017年 Jakin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 300, 45)];
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    printf("我要开始了哦");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
