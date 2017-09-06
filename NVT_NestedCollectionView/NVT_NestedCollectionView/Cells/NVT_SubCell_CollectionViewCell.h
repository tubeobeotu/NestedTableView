//
//  NVT_SubCell_CollectionViewCell.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PA_Treding_Model.h"
@interface NVT_SubCell_CollectionViewCell : UICollectionViewCell
- (void)setupDataToView:(PA_Treding_Model *)model;
@end
