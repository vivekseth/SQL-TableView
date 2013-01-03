//
//  CustomCell.m
//  SQL+TableView
//
//  Created by Vivek Seth on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize Name = _Name;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.Name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        self.Name.text = @"hello world";
        self.Name.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.Name];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
