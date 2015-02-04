//
//  ViewController.m
//  Stepic
//
//  Created by Александр Черный on 08/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "Course.h"
#import "Courses.h"
#import "CourseTableViewCell.h"
#import "ImageRequest.h"
#import "ImageRequest+Factory.h"
#import "NetworkManager.h"
#import "NSString+UTCDate.h"
#import "UIImageView+AFNetworking.h"
#import "ViewController.h"

static NSString * const kCourseCellReuseIdentifier = @"CourseCellReuseIdentifier";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *courses;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.topViewController.title = @"Курсы";
    
    self.courses = [NSArray array];
    
    HTTPRequestSucessBlock success = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        Courses *courses = responseObject;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isFeatured = YES"];
        self.courses = [courses.courses filteredArrayUsingPredicate:predicate];
        
        [self.tableView reloadData];
        
        // NSLog(@"Success: %@", courses);
    };
    
    HTTPRequestFailureBlock failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Failure: %@", error);
    };
    
    [[NetworkManager sharedInstance] fetchRequest:[APIRequest requestOfCourses] success:success failure:failure];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCourseCellReuseIdentifier];
    
    if (cell == nil)
    {
        cell = [[CourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCourseCellReuseIdentifier];
    }
    
    Course *course = self.courses[indexPath.row];
    
    if (course.coverImage == nil)
    {
        void (^success)(UIImage *image)  = ^(UIImage *image)
        {
            void (^animations)() = ^
            {
                cell.coverImageView.image = image;
            };
            
            [UIView transitionWithView:cell.coverImageView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:animations completion:nil];
        };
        
        [course requestCoverWithSuccess:success];
    }
    
    cell.titleLabel.text = course.title;
    cell.datesLabel.text = [course dates];
    
    return cell;
}

@end
