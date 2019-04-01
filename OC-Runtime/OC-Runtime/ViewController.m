//
//  ViewController.m
//  OC-Runtime
//
//  Created by 廖佩志 on 2019/3/23.
//  Copyright © 2019 廖佩志. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Son.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (strong, nonatomic) Son *son;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    Father* fa = [[Father alloc] init];
    self.son = [[Son alloc] init];
    _son.name = @"lpz1";
    Class a = [self.son class];
    object_getClassName(a);
    object_getClass(a);
    object_getClass(object_getClass(a));
    class_getName(a);


//    Method a = class_getClassMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)
    
}
// MARK: Block 种类
/*
 只用到全局变量、静态变量的block也可以是_NSConcreteGlobalBlock
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _son.name = @"lpz2";
    [_son addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    static int l = 3;
    void (^myBlock)(void) = ^{
        l++;
        NSLog(@"block中：%d", l);
    };
    myBlock();
    //输出：<__NSGlobalBlock__: 0x1092ab0b0>
    NSLog(@"%@",myBlock);
    NSLog(@"block外：%d", l);
    __block int a = 0;
    void (^myBlock2)(void) = ^{
        a++;
        NSLog(@"myBlock2外：%d", a);
    };
    myBlock2();
    //<__NSMallocBlock__: 0x600001dc33c0>
    NSLog(@"%@",myBlock2);
    NSLog(@"myBlock2外：%d", a);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

}

-(void)dealloc {
    [_son removeObserver:self forKeyPath: @"name"];
}
@end
