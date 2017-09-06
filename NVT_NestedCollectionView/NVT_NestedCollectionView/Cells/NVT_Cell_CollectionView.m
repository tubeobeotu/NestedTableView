//
//  NVT_Cell_CollectionView.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_Cell_CollectionView.h"
@interface NVT_Cell_CollectionView() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *csv_Content;

@end
@implementation NVT_Cell_CollectionView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.csv_Content.delegate = self;
    self.csv_Content.dataSource = self;
    [self.csv_Content registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
}
- (void)setDirectionScroll:(BOOL)type
{
    ((UICollectionViewFlowLayout *)self.csv_Content.collectionViewLayout).scrollDirection = type == YES ? UICollectionViewScrollDirectionHorizontal : UICollectionViewScrollDirectionVertical;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate subCellNumberOfRowsInSection:[self.delegate currentSection]];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.csv_Content dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.delegate subCellNumberOfSections];
}
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidSelectRowAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidDeselectRowAtIndexPath:indexPath];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellSizeForItemAtIndexPath:indexPath];
}
@end
