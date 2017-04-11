//
//  SiteCell.m
//  NibsAndTables2
//
//  Created by Xcode User on 2017-03-21.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import "SiteCell.h"

@implementation SiteCell
@synthesize primaryLabel, secondaryLabel, myImageView;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        primaryLabel = [[UILabel alloc] init];
        primaryLabel.font = [UIFont systemFontOfSize:18];
        primaryLabel.textColor = [UIColor blackColor];
        primaryLabel.backgroundColor = [UIColor clearColor];
        primaryLabel.textAlignment = NSTextAlignmentLeft;
        
        secondaryLabel = [[UILabel alloc] init];
        secondaryLabel.font = [UIFont systemFontOfSize:12];
        secondaryLabel.textColor = [UIColor blueColor];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        secondaryLabel.textAlignment = NSTextAlignmentLeft;
                               
        myImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
                               
                               
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    myImageView.frame = CGRectMake(5, 5, 40, 40);
    primaryLabel.frame = CGRectMake(110, 5, 260, 20);
    secondaryLabel.frame = CGRectMake(110, 30, 260, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
