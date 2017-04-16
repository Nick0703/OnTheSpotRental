//
//  SiteCell.h
//  NibsAndTables2
//
//  Created by Jawaad Sheikh on 2016-03-15.
//  Copyright © 2016 Jawaad Sheikh. All rights reserved.
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
