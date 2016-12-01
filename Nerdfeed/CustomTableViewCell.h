//
//  CustomTableViewCell.h
//  Nerdfeed
//
//  Created by JohnnyChen on 16/10/25.
//  Copyright © 2016年 YY.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *upcomingTimelabel;

@end
