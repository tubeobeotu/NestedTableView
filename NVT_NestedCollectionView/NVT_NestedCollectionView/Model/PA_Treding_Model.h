//
//  PA_Treding_Model.h
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PA_Treding_Model : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *imageURL;
@property(assign) long numLike;
@property(assign) long numDislike;
@property(strong, nonatomic) NSArray *friends;
@end


