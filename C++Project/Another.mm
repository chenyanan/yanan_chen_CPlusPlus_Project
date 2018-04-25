//
//  Another.cpp
//  C+++
//
//  Created By chenyanan on 2017/01/13
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#include "Another.hpp"
#import <Foundation/Foundation.h>

#pragma mark - parameter init
Another::Another(STR name,
                 INT Age,
                 STR birth,
                 PTR Sex,
                 Vblk didClick)
:
RCT(1),
_name(name),
_Age(Age),
_birth(birth),
_Sex(Sex),
_didClick(didClick) 
{
    NSLog(@"parameter init");
}

#pragma mark - deinit
Another::~Another() {
	NSLog(@"Another dealloc");
}

