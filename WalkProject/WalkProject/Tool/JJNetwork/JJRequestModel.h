//
//  JJRequestModel.h
//  JJ
//
//  Created by meimi on 2018/8/15.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface JJRequestModel : JSONModel

@property (nonatomic, strong) NSString<Optional> * l_errno;
@property (nonatomic, strong) NSString<Optional> * errmsg;
@property (nonatomic, strong) NSDictionary<Optional> * data;
@property (nonatomic, strong) NSString<Optional> * timestamp;

@end
