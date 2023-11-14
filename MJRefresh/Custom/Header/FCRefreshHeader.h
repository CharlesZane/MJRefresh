//
//  FCRefreshHeader.h
//  MJRefresh
//
//  Created by zhanchuanxi on 2023/11/14.
//  Copyright © 2023 小码哥. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCRefreshHeader : MJRefreshHeader
@property (nonatomic, copy)  NSString * loadingImage;
@property (nonatomic,assign) CGFloat loadingDuration;
@end

NS_ASSUME_NONNULL_END
