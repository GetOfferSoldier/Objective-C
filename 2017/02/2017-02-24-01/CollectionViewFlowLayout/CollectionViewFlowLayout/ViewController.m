//
//  ViewController.m
//  CollectionViewFlowLayout
//
//  Created by PlutusCat on 2017/2/23.
//  Copyright © 2017年 PlutusCat. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CAAnimationDelegate>
@property (nonatomic, strong) UICollectionView *collect;
@property (nonatomic, strong) UITextField *sectionNumField;
@property (nonatomic, assign) NSInteger sectionNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sectionNum = 10;
    
    CustomLayout *layout = [[CustomLayout alloc]init];
    UICollectionView *collect  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource = self;
    collect.backgroundColor = self.view.backgroundColor;
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
    self.collect = collect;
    
    UITextField *sectionNumField = [[UITextField alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 30)];
    sectionNumField.placeholder = @"输入正整数";
    sectionNumField.textAlignment = NSTextAlignmentCenter;
    sectionNumField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:sectionNumField];
    self.sectionNumField = sectionNumField;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, CGRectGetMaxY(sectionNumField.frame)+10, 60, 30);
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.text = @"开始动画";
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction {
    self.sectionNum = [_sectionNumField.text integerValue];
    [UIView animateWithDuration:0.25 animations:^{
        [self.collect reloadData];
    } completion:^(BOOL finished) {
        [self transformAction];
    }];
}

- (void)transformAction {

    CABasicAnimation *collectionRota = [self rotationAnimationWithDuration:5.0];
    
    //放大缩小动画
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 2.5;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.autoreverses = true;

    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.delegate = self;
    animaGroup.duration = scaleAnimation.duration*2;
    animaGroup.repeatCount = HUGE_VALF;
    animaGroup.animations = @[collectionRota,scaleAnimation];
    [_collect.layer addAnimation:animaGroup forKey:@"groupAnimation"];
    
}

//无限旋转动画 封装出来是为了给小图旋转也可以使用
- (CABasicAnimation *)rotationAnimationWithDuration:(CGFloat)duration{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI *2.0 ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = true;
    return rotationAnimation;
}


//动画开始时
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始了");
}

//动画结束时
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //方法中的flag参数表明了动画是自然结束还是被打断,比如调用了removeAnimationForKey:方法或removeAnimationForKey方法，flag为NO，如果是正常结束，flag为YES。
    NSLog(@"结束了");
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _sectionNum;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
