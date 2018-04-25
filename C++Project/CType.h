//
//  CType.hpp
//  C++Project
//
//  Created by chenyanan on 2017/1/3.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#ifndef CType_hpp
#define CType_hpp

#include <stdio.h>
#include <string>
#include <vector>
#include <memory>

//should check details of NSInteger to update
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
typedef long CInt;
#else
typedef int  CInt;
#endif

typedef void*                        CImg;
typedef std::string                  CStr;

typedef std::unique_ptr<std::string> CUStr;
typedef std::unique_ptr<CImg>        CUImg;
typedef std::unique_ptr<CInt>        CUInt;

typedef void(^CIBlk)(CInt integer);
typedef void(^CSBlk)(CStr string);
typedef void(^CMBlk)(CImg img);
typedef void(^CVBlk)(void);

typedef std::unique_ptr<CSBlk>       CUSbk;
typedef std::unique_ptr<CIBlk>       CUIbk;
typedef std::unique_ptr<CVBlk>       CUVbk;
typedef std::unique_ptr<CMBlk>       CUMbk;

typedef std::vector<std::string>     CVStr;

#endif /* CType_hpp */
