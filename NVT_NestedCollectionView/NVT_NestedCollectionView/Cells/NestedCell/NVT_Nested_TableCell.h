//
//  NVT_Nested_TableCell.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVT_Nested_BaseCell.h"
@interface NVT_Nested_TableCell : NVT_Nested_BaseCell
@property(weak, nonatomic) id<NVT_NestedProtocolTableView> delegate;
@end
