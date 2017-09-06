//
//  NVT_Nested_CollectionCell.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_Nested_CollectionCell.h"
#import "NVT_Cell_CollectionView.h"
@interface NVT_Nested_CollectionCell() <NVT_NestedProtocolCollectionView>
@property (weak, nonatomic) IBOutlet NVT_Cell_CollectionView *containterView;

@end
@implementation NVT_Nested_CollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.containterView.delegate = self;
    
    // Initialization code
}
- (void)setDelegate:(id<NVT_NestedProtocolCollectionView>)delegate
{
    _delegate = delegate;
    [self.containterView setDirectionScroll:[self.delegate isHorizontalScroll:self.section]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark NVT_NestedProtocolCollectionView
- (NSInteger)currentSection
{
    return self.section;
}
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section
{
    return [self.delegate subCellNumberOfRowsInSection:section];
}
//- (UICollectionViewCell *)subCellCellCollectionForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [self.delegate subCellCellCollectionForRowAtIndexPath:indexPath];
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
- (CGSize)subCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellSizeForItemAtIndexPath:indexPath];
}
@end
