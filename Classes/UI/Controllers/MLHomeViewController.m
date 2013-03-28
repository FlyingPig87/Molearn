//
//  MLHomeViewController.m
//  Molearn
//
//  Created by chen jian on 3/19/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLHomeViewController.h"
#import "UINavigationItemAdditions.h"
#import "MLAudioPlay.h"

@interface MLHomeViewController ()

@end

@implementation MLHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.titleView = [UINavigationItem titleViewForTitle:@"MoLearn"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn addTarget:self action:@selector(playsounds) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(100, 50, 40, 20)];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)playsounds {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];
    [[MLAudioPlay defaultAudioPlay] playWithData:data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
