//
//  CourseTableViewCell.h
//  Stepic
//
//  Created by Александр Черный on 03/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *coverImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *datesLabel;

@end
