//
//  Model.hpp
//  C++Project
//
//  Created by chenyanan on 2016/12/25.
//  Copyright © 2016年 chenyanan. All rights reserved.
//

#ifndef Model_hpp
#define Model_hpp

#include "CType.h"

class Model {
    
    friend void swap(Model& lhs, Model& rhs);
    
public:
    const CUStr& getLUStr();
    const CUStr& getLDStr();
    const CUStr& getRUStr();
    const CUStr& getRDStr();
    const CUVbk& getVBlk();
    
    void setLUStrNoTrg(CStr str);
    void setLDStrNoTrg(CStr str);
    void setRUStrNoTrg(CStr str);
    void setRDStrNoTrg(CStr str);
    
    void setLUStr(CStr str);
    void setLDStr(CStr str);
    void setRUStr(CStr str);
    void setRDStr(CStr str);
    void setVBlk(CVBlk blk);
    
    void setWillSetLUStrBlk(CSBlk blk);
    void setWillSetLDStrBlk(CSBlk blk);
    void setWillSetRUStrBlk(CSBlk blk);
    void setWillSetRDStrBlk(CSBlk blk);
    
    void setDidSetLUStrBlk(CSBlk blk);
    void setDidSetLDStrBlk(CSBlk blk);
    void setDidSetRUStrBlk(CSBlk blk);
    void setDidSetRDStrBlk(CSBlk blk);
    
    Model();
    ~Model();
    Model(CStr LUStr, CStr LDStr, CStr RUStr, CStr RDStr, CVBlk aVBlk);
    
    Model(Model&& model) = delete;
    Model(const Model& model) = delete;
    Model& operator=(Model model) = delete;
    
private:
    CUStr _LUStr;
    CUStr _LDStr;
    CUStr _RUStr;
    CUStr _RDStr;
    CUVbk _aVBlk;
    
    CUSbk _LUStrWillSetBlk;
    CUSbk _LDStrWillSetBlk;
    CUSbk _RUStrWillSetBlk;
    CUSbk _RDStrWillSetBlk;
    
    CUSbk _LUStrDidSetBlk;
    CUSbk _LDStrDidSetBlk;
    CUSbk _RUStrDidSetBlk;
    CUSbk _RDStrDidSetBlk;
};

typedef std::shared_ptr<Model> CSModel;
typedef std::vector<std::shared_ptr<Model>> CVSModel;

#define CMSModel std::make_shared<Model>

#endif /* Model_hpp */
