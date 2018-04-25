//
//  Model.cpp
//  C++Project
//
//  Created by chenyanan on 2016/12/25.
//  Copyright © 2016年 chenyanan. All rights reserved.
//

#include "Model.hpp"
#import <Foundation/Foundation.h>

#pragma mark - swap
void swap(Model& lhs, Model& rhs) {
    using std::swap;
    swap(lhs._LUStr, rhs._LUStr);
    swap(lhs._LDStr, rhs._LDStr);
    swap(lhs._RUStr, rhs._RUStr);
    swap(lhs._RDStr, rhs._RDStr);
    swap(lhs._aVBlk, rhs._aVBlk);
}

#pragma mark - getter
const CUStr& Model::getLUStr() {
    return _LUStr;
}

const CUStr& Model::getLDStr() {
    return _LDStr;
}

const CUStr& Model::getRUStr() {
    return _RUStr;
}

const CUStr& Model::getRDStr() {
    return _RDStr;
}

const CUVbk& Model::getVBlk() {
    return _aVBlk;
}

#pragma mark - setter
void Model::setLUStr(CStr string) {
    
    if (_LUStrWillSetBlk) {
        (*_LUStrWillSetBlk)(string);
    }
    
    setLUStrNoTrg(string);
    
    if (_LDStrDidSetBlk) {
        (*_LDStrDidSetBlk)(string);
    }
}

void Model::setLDStr(CStr string) {
    
    if (_LDStrWillSetBlk) {
        (*_LDStrWillSetBlk)(string);
    }
    
    setLDStrNoTrg(string);
    
    if (_LDStrDidSetBlk) {
        (*_LDStrDidSetBlk)(string);
    }
}

void Model::setRUStr(CStr string) {
    
    if (_RUStrWillSetBlk) {
        (*_RUStrWillSetBlk)(string);
    }
    
    setRUStrNoTrg(string);
    
    if (_RDStrDidSetBlk) {
        (*_RDStrDidSetBlk)(string);
    }
}

void Model::setRDStr(CStr string) {
    
    if (_RDStrWillSetBlk) {
        (*_RDStrWillSetBlk)(string);
    }
    
    setRDStrNoTrg(string);
    
    if (_RDStrDidSetBlk) {
        (*_RDStrDidSetBlk)(string);
    }
}

void Model::setVBlk(CVBlk block) {
    _aVBlk.reset(new CVBlk(block));
}

void Model::setLUStrNoTrg(CStr string) {
    _LUStr.reset(new CStr(string));
}

void Model::setLDStrNoTrg(CStr string) {
    _LDStr.reset(new CStr(string));
}

void Model::setRUStrNoTrg(CStr string) {
    _RUStr.reset(new CStr(string));
}

void Model::setRDStrNoTrg(CStr string) {
    _RDStr.reset(new CStr(string));
}

void Model::setWillSetLUStrBlk(CSBlk block) {
    _LUStrWillSetBlk.reset(new CSBlk(block));
}

void Model::setWillSetLDStrBlk(CSBlk block) {
    _LDStrWillSetBlk.reset(new CSBlk(block));
}

void Model::setWillSetRUStrBlk(CSBlk block) {
    _RUStrWillSetBlk.reset(new CSBlk(block));
}

void Model::setWillSetRDStrBlk(CSBlk block) {
    _RDStrWillSetBlk.reset(new CSBlk(block));
}

void Model::setDidSetLUStrBlk(CSBlk block) {
    _LUStrDidSetBlk.reset(new CSBlk(block));
}

void Model::setDidSetLDStrBlk(CSBlk block) {
    _LDStrDidSetBlk.reset(new CSBlk(block));
}

void Model::setDidSetRUStrBlk(CSBlk block) {
    _RUStrDidSetBlk.reset(new CSBlk(block));
}

void Model::setDidSetRDStrBlk(CSBlk block) {
    _RDStrDidSetBlk.reset(new CSBlk(block));
}

#pragma mark - default init
Model::Model()
:
_LUStr(new CStr(nullptr)),
_LDStr(new CStr(nullptr)),
_RUStr(new CStr(nullptr)),
_RDStr(new CStr(nullptr)),
_aVBlk(new CVBlk(nil)),
_LUStrWillSetBlk(new CSBlk(nil)),
_LDStrWillSetBlk(new CSBlk(nil)),
_RUStrWillSetBlk(new CSBlk(nil)),
_RDStrWillSetBlk(new CSBlk(nil)),
_LUStrDidSetBlk(new CSBlk(nil)),
_LDStrDidSetBlk(new CSBlk(nil)),
_RUStrDidSetBlk(new CSBlk(nil)),
_RDStrDidSetBlk(new CSBlk(nil))
{

}

#pragma mark - parameter init
Model::Model(CStr leftUpString,
             CStr leftDownString,
             CStr rightUpString,
             CStr rightDownString,
             CVBlk aVoidBlock)
:
_LUStr(new CStr(leftUpString)),
_LDStr(new CStr(leftDownString)),
_RUStr(new CStr(rightUpString)),
_RDStr(new CStr(rightDownString)),
_aVBlk(new CVBlk(aVoidBlock)),
_LUStrWillSetBlk(new CSBlk(nil)),
_LDStrWillSetBlk(new CSBlk(nil)),
_RUStrWillSetBlk(new CSBlk(nil)),
_RDStrWillSetBlk(new CSBlk(nil)),
_LUStrDidSetBlk(new CSBlk(nil)),
_LDStrDidSetBlk(new CSBlk(nil)),
_RUStrDidSetBlk(new CSBlk(nil)),
_RDStrDidSetBlk(new CSBlk(nil))
{
    
}

#pragma mark - deinit
Model::~Model() {
    NSLog(@"Model dealloc");
}
