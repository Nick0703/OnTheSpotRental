//
//  SiteCell.h
//  NibsAndTables2
//
//  Created by Xcode User on 2017-03-21.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiteCell : UITableViewCell
{
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UIImageView *myImageView;
}
@property (nonatomic, strong) UILabel *primaryLabel;
@property (nonatomic, strong) UILabel *secondaryLabel;
@property (nonatomic, strong) UIImageView *myImageView;
@end
