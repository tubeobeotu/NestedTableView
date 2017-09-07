//
//  NVT_SubCell_Trending.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/7/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVT_BaseSubView.h"
@interface NVT_SubCell_Trending : NVT_BaseSubView
@property (weak, nonatomic) IBOutlet UIImageView *img_Background;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Number;
@property (weak, nonatomic) IBOutlet UIImageView *img_First;
@property (weak, nonatomic) IBOutlet UIImageView *img_Second;
@property (weak, nonatomic) IBOutlet UIImageView *img_Third;

@end
