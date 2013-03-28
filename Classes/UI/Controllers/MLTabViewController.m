//
//  MLTabViewController.m
//  Molearn
//
//  Created by chen jian on 3/19/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLTabViewController.h"
#import "MLHomeViewController.h"
#import "MLSearchViewController.h"
#import "MLFavouritesViewController.h"
#import "MLSettingViewController.h"

@interface MLTabViewController ()

@end

@implementation MLTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MLHomeViewController *home = [[[MLHomeViewController alloc] init] autorelease];
    UINavigationController *homeNav = [[[UINavigationController alloc] initWithRootViewController:home] autorelease];
     homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"home"] tag:1];
    
    MLSearchViewController *search = [[[MLSearchViewController alloc] init] autorelease];
    UINavigationController *searchNav = [[[UINavigationController alloc] initWithRootViewController:search] autorelease];
    searchNav.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Search" image:[UIImage imageNamed:@"search"] tag:2] autorelease];
    
    MLFavouritesViewController *favourite = [[[MLFavouritesViewController alloc] init] autorelease];
    UINavigationController *favNav = [[[UINavigationController alloc] initWithRootViewController:favourite] autorelease];
    favNav.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Favourite" image:[UIImage imageNamed:@"favorites"] tag:3] autorelease];
    
    MLSettingViewController *setting = [[[MLSettingViewController alloc] init] autorelease];
    UINavigationController *setNav = [[[UINavigationController alloc] initWithRootViewController:setting] autorelease];
    setNav.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Setting" image:[UIImage imageNamed:@"about"] tag:4] autorelease];
    
    self.viewControllers = [NSArray arrayWithObjects:homeNav,searchNav,favNav,setNav,nil];
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
