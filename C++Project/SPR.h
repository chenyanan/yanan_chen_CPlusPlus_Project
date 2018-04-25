//
//  SPR.hpp
//  C+++
//
//  Created by chenyanan on 2017/1/5.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#ifndef SPR_hpp
#define SPR_hpp

#include <algorithm>
#include "RCT.h"

template<typename T> class SPR;
template<typename T> void swap(SPR<T>& lhs, SPR<T>& rhs);

template <typename T>
class SPR {
    
    friend void swap<T>(SPR<T>& lhs, SPR<T>& rhs);
    
public:
    const T* _spr;
    
    ~SPR();
    
    SPR(T* spr = nullptr);
    
    SPR(SPR<T>&& spr);
    
    SPR(const SPR<T>& spr);
    
    SPR<T>& operator=(SPR<T> spr);
    
    const T* operator->();
    
    const T& operator*();
    
    operator T* ();
};

#pragma mark - swap
template<typename T> void swap(SPR<T>& lhs, SPR<T>& rhs) {
    using std::swap;
    swap(lhs._spr, rhs._spr);
}

#pragma mark - deinit
template<typename T> inline SPR<T>::~SPR() {
    if (_spr && --(static_cast<const RCT *>(_spr)->_cnt) == 0) {
        delete _spr;
        _spr = nullptr;
    }
}

#pragma mark - init
template<typename T> inline SPR<T>::SPR(T* spr) : _spr(spr) {
    
}

#pragma mark - move init
template<typename T> inline SPR<T>::SPR(SPR<T>&& spr) : _spr(spr._spr) {
    spr._spr = nullptr;
}

#pragma mark - copy init
template<typename T> inline SPR<T>::SPR(const SPR<T>& spr) : _spr(spr._spr) {
    ++(static_cast<const RCT *>(_spr)->_cnt);
}

#pragma mark - operator =
template<typename T> inline SPR<T>& SPR<T>::operator=(SPR<T> spr) {
    swap(*this, spr);
    return *this;
}

#pragma mark - operator ->
template<typename T> inline const T* SPR<T>::operator->() {
    return _spr;
}

#pragma mark - operator *
template<typename T> inline const T& SPR<T>::operator*() {
    return *_spr;
}

#pragma mark - operator T*
template<typename T> inline SPR<T>::operator T*() {
    return _spr;
}

#endif /* SPR_hpp */
