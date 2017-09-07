//
//  NVT_NestedProtocol.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PA_Treding_Model.h"
typedef enum : NSInteger{
    SectionType_Collection = 0,
    SectionType_TableView
}SectionType;
typedef enum : NSInteger{
    SubCell_Trending = 0,
    SubCell_Discovery,
    SubCell_StartTrend
}SubCellType;
@protocol NVT_NestedMainProtocol <NSObject>

//Data
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)cellTableForRowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (NSInteger)numberOfSections;
- (NSString *)title:(NSInteger)section;
- (CGFloat)heightForHeader:(NSInteger)section;

@end
@protocol NVT_NestedProtocol <NSObject>
- (PA_Treding_Model *)getModelAt:(NSIndexPath *)index;
//Data
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section;
@optional
- (SubCellType)getSubCellType;
- (SubCellType)getSubCellType:(NSIndexPath *)index;
- (NSInteger)currentSection;
- (NSInteger)subCellNumberOfSections;

//Delegate
- (void)subCellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)subCellDidDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
@end

@protocol NVT_NestedProtocolTableView <NVT_NestedProtocol>
//DataSource
//- (UITableViewCell *)subCellCellTableForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional
//Delegate
- (CGFloat)subCellHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)subCellEstimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0);


@end

@protocol NVT_NestedProtocolCollectionView <NVT_NestedProtocol>
//DataSource
//- (UICollectionViewCell *)subCellCellCollectionForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional
//Delegate
- (BOOL)isHorizontalScroll:(NSInteger)section;
- (CGSize)subCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
