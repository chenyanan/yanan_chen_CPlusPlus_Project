//
//  makemodel.hpp
//  C++Project
//
//  Created by chenyanan on 2017/1/3.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#ifndef makemodel_hpp
#define makemodel_hpp

#include "CType.h"
#include <iostream>

class makemodel {
public:
    static void make(CStr path, CStr author, CStr clsName, CVStr headers, CVStr instance, CVStr instanceType);
};

#endif /* makemodel_hpp */
