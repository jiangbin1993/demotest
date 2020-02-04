//
//  FontMacro.h
//  JJ
//
//  Created by meimi on 2018/8/9.
//  Copyright © 2018年 meimi. All rights reserved.
//

#ifndef FontMacro_h
#define FontMacro_h

#define kFontFamilyRegular             @"PingFangSC-Regular"
#define kFontFamilyBold                @"PingFangSC-Semibold"
#define kFontFamilyMedium              @"PingFangSC-Medium"

#define PingFangRegularFont(font)   ([[UIFont familyNames] containsObject:@"PingFang SC"] ? [UIFont fontWithName:kFontFamilyRegular size:k6sWidth(font)] : [UIFont systemFontOfSize:k6sWidth(font)])

#define PingFangMediumFont(font) ([[UIFont familyNames] containsObject:@"PingFang SC"] ? [UIFont fontWithName:kFontFamilyMedium size:k6sWidth(font)] : [UIFont systemFontOfSize:k6sWidth(font)])

#define PingFangBoldFont(font)  ([[UIFont familyNames] containsObject:@"PingFang SC"] ? [UIFont fontWithName:kFontFamilyBold size:k6sWidth(font)] : [UIFont fontWithName:@"Helvetica-Bold" size:k6sWidth(font)])

#define font11 [UIFont systemFontOfSize:11]
#define font12 [UIFont systemFontOfSize:12]
#define font13 [UIFont systemFontOfSize:13]
#define font14 [UIFont systemFontOfSize:14]
#define font15 [UIFont systemFontOfSize:15]
#define font16 [UIFont systemFontOfSize:16]
#define font17 [UIFont systemFontOfSize:17]
#define font18 [UIFont systemFontOfSize:18]
#define font19 [UIFont systemFontOfSize:19]
#define font24 [UIFont systemFontOfSize:24]

#endif /* FontMacro_h */
