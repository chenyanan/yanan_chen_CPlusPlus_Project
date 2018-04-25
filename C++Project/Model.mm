//
//  Model.cpp
//  C++Project
//
//  Created By chenyanan on 2017/01/04
//  Copyright © 2017年 chenyanan. All rights reserved.
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

const CUVbk& Model::getAVBlk() {
	return _aVBlk;
}


#pragma mark - setter
void Model::setLUStr(CStr str) {
	if (*_LUStrWlStBlk) {
		(*_LUStrWlStBlk)(str);
	}

	setLUStrNoTrg(str);

	if (*_LUStrDiStBlk) {
		(*_LUStrDiStBlk)(str);
	}
}

void Model::setLDStr(CStr str) {
	if (*_LDStrWlStBlk) {
		(*_LDStrWlStBlk)(str);
	}

	setLDStrNoTrg(str);

	if (*_LDStrDiStBlk) {
		(*_LDStrDiStBlk)(str);
	}
}

void Model::setRUStr(CStr str) {
	if (*_RUStrWlStBlk) {
		(*_RUStrWlStBlk)(str);
	}

	setRUStrNoTrg(str);

	if (*_RUStrDiStBlk) {
		(*_RUStrDiStBlk)(str);
	}
}

void Model::setRDStr(CStr str) {
	if (*_RDStrWlStBlk) {
		(*_RDStrWlStBlk)(str);
	}

	setRDStrNoTrg(str);

	if (*_RDStrDiStBlk) {
		(*_RDStrDiStBlk)(str);
	}
}

void Model::setAVBlk(CVBlk blk) {
	if (*_aVBlkWlStBlk) {
		(*_aVBlkWlStBlk)();
	}

	setAVBlkNoTrg(blk);

	if (*_aVBlkDiStBlk) {
		(*_aVBlkDiStBlk)();
	}
}


void Model::setLUStrNoTrg(CStr str) {
	_LUStr.reset(new CStr(str));
}

void Model::setLDStrNoTrg(CStr str) {
	_LDStr.reset(new CStr(str));
}

void Model::setRUStrNoTrg(CStr str) {
	_RUStr.reset(new CStr(str));
}

void Model::setRDStrNoTrg(CStr str) {
	_RDStr.reset(new CStr(str));
}

void Model::setAVBlkNoTrg(CVBlk blk) {
	_aVBlk.reset(new CVBlk(blk));
}


void Model::setWlStLUStrBlk(CSBlk blk) {
	_LUStrWlStBlk.reset(new CSBlk(blk));
}

void Model::setWlStLDStrBlk(CSBlk blk) {
	_LDStrWlStBlk.reset(new CSBlk(blk));
}

void Model::setWlStRUStrBlk(CSBlk blk) {
	_RUStrWlStBlk.reset(new CSBlk(blk));
}

void Model::setWlStRDStrBlk(CSBlk blk) {
	_RDStrWlStBlk.reset(new CSBlk(blk));
}

void Model::setWlStAVBlkBlk(CVBlk blk) {
	_aVBlkWlStBlk.reset(new CVBlk(blk));
}


void Model::setDiStLUStrBlk(CSBlk blk) {
	_LUStrDiStBlk.reset(new CSBlk(blk));
}

void Model::setDiStLDStrBlk(CSBlk blk) {
	_LDStrDiStBlk.reset(new CSBlk(blk));
}

void Model::setDiStRUStrBlk(CSBlk blk) {
	_RUStrDiStBlk.reset(new CSBlk(blk));
}

void Model::setDiStRDStrBlk(CSBlk blk) {
	_RDStrDiStBlk.reset(new CSBlk(blk));
}

void Model::setDiStAVBlkBlk(CVBlk blk) {
	_aVBlkDiStBlk.reset(new CVBlk(blk));
}


#pragma mark - default init
Model::Model()
:
_LUStr(new CStr(nullptr)),
_LDStr(new CStr(nullptr)),
_RUStr(new CStr(nullptr)),
_RDStr(new CStr(nullptr)),
_aVBlk(new CVBlk(nil)),
_LUStrWlStBlk(new CSBlk(nil)),
_LDStrWlStBlk(new CSBlk(nil)),
_RUStrWlStBlk(new CSBlk(nil)),
_RDStrWlStBlk(new CSBlk(nil)),
_aVBlkWlStBlk(new CVBlk(nil)),
_LUStrDiStBlk(new CSBlk(nil)),
_LDStrDiStBlk(new CSBlk(nil)),
_RUStrDiStBlk(new CSBlk(nil)),
_RDStrDiStBlk(new CSBlk(nil)),
_aVBlkDiStBlk(new CVBlk(nil)) 
{
    NSLog(@"default init");
}


#pragma mark - parameter init
Model::Model(CStr LUStr,
             CStr LDStr,
             CStr RUStr,
             CStr RDStr,
             CVBlk aVBlk)
:
_LUStr(new CStr(LUStr)),
_LDStr(new CStr(LDStr)),
_RUStr(new CStr(RUStr)),
_RDStr(new CStr(RDStr)),
_aVBlk(new CVBlk(aVBlk)),
_LUStrWlStBlk(new CSBlk(nil)),
_LDStrWlStBlk(new CSBlk(nil)),
_RUStrWlStBlk(new CSBlk(nil)),
_RDStrWlStBlk(new CSBlk(nil)),
_aVBlkWlStBlk(new CVBlk(nil)),
_LUStrDiStBlk(new CSBlk(nil)),
_LDStrDiStBlk(new CSBlk(nil)),
_RUStrDiStBlk(new CSBlk(nil)),
_RDStrDiStBlk(new CSBlk(nil)),
_aVBlkDiStBlk(new CVBlk(nil)) 
{
    NSLog(@"parameter init");
}


#pragma mark - deinit
Model::~Model() {
	NSLog(@"Model dealloc");
}

