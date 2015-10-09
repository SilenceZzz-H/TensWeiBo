//
//  WeiboCell.m
//  TensWeiBo
//
//  Created by gh on 15-10-8.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "WeiboCell.h"
#import "UserInfoModel.h"

@implementation WeiboCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


-(void)setModel:(WeiboModel *)model{
    
    _model = model;
    
    UserInfoModel *userInfo = [[UserInfoModel alloc] init];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *createTime = [formatter stringFromDate:_model.created_at];
    
    self.createTimeLabel.text = createTime;
    self.weiboNameLabel.text = userInfo.name;
    self.contextTextView.text = _model.text;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.profile_image_url]];

}


#pragma mark - buttonAction
- (IBAction)menuButton:(UIButton *)sender {
}

// 分享
- (IBAction)shareButton:(UIButton *)sender {
}

// 评论
- (IBAction)commentButton:(UIButton *)sender {
}

// 赞
- (IBAction)praiseButton:(UIButton *)sender {
}

@end
