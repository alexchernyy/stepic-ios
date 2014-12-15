//
//  ViewController.m
//  Stepic
//
//  Created by Александр Черный on 08/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "Courses.h"
#import "NetworkManager.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NetworkManager sharedInstance] fetchRequest:[APIRequest requestOfCourses] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        Courses *courses = responseObject;
        NSLog(@"Success: %@", courses);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
