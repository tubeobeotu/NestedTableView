//
//  NVT_Cell_UITableView.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVT_CellBase.h"
@interface NVT_Cell_TableView : NVT_CellBase
@property(weak, nonatomic) id<NVT_NestedProtocolTableView> delegate;
@end
