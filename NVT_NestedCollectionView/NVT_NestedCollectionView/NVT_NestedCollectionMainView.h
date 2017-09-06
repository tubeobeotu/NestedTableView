//
//  NVT_NestedCollectionMainView.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseSubView.h"
#import "NVT_NestedProtocol.h"
@interface NVT_NestedCollectionMainView : BaseSubView
@property(weak, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UITableView *tbl_Content;
- (void)registerCell:(SectionType)type;
- (UITableViewCell *)getCellWith:(SectionType)type indexPath:(NSIndexPath *)indexPath;

@end
