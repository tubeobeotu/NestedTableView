//
//  NVT_Nested_TableCell.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_Nested_TableCell.h"
#import "NVT_NestedProtocol.h"
#import "NVT_Cell_TableView.h"
@interface NVT_Nested_TableCell() <NVT_NestedProtocolTableView>
@property (weak, nonatomic) IBOutlet NVT_Cell_TableView *containerView;

@end
@implementation NVT_Nested_TableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.containerView.delegate = self;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark NVT_NestedProtocolTableView
- (NSInteger)currentSection
{
    return self.section;
}
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section
{
    return [self.delegate subCellNumberOfRowsInSection:section];
}
//- (UITableViewCell *)subCellCellTableForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [self.delegate subCellCellTableForRowAtIndexPath:indexPath];
//}
- (NSInteger)subCellNumberOfSections
{
    return [self.delegate subCellNumberOfSections];
}

- (void)subCellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidSelectRowAtIndexPath:indexPath];
}
- (void)subCellDidDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidDeselectRowAtIndexPath:indexPath];
}
- (CGFloat)subCellHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellHeightForRowAtIndexPath:indexPath];
}
@end
