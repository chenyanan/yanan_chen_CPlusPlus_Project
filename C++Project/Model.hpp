//
//  Model.hpp
//  C++Project
//
//  Created By chenyanan on 2017/01/04
//  Copyright © 2017年 chenyanan. All rights reserved.
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
	const CUVbk& getAVBlk();

	void setLUStrNoTrg(CStr str);
	void setLDStrNoTrg(CStr str);
	void setRUStrNoTrg(CStr str);
	void setRDStrNoTrg(CStr str);
	void setAVBlkNoTrg(CVBlk blk);

	void setLUStr(CStr str);
	void setLDStr(CStr str);
	void setRUStr(CStr str);
	void setRDStr(CStr str);
	void setAVBlk(CVBlk blk);

	void setWlStLUStrBlk(CSBlk blk);
	void setWlStLDStrBlk(CSBlk blk);
	void setWlStRUStrBlk(CSBlk blk);
	void setWlStRDStrBlk(CSBlk blk);
	void setWlStAVBlkBlk(CVBlk blk);

	void setDiStLUStrBlk(CSBlk blk);
	void setDiStLDStrBlk(CSBlk blk);
	void setDiStRUStrBlk(CSBlk blk);
	void setDiStRDStrBlk(CSBlk blk);
	void setDiStAVBlkBlk(CVBlk blk);


	Model();
	~Model();
	Model(CStr LUStr,CStr LDStr,CStr RUStr,CStr RDStr,CVBlk aVBlk);

	Model(Model&& model) = delete;
	Model(const Model& model) = delete;
	Model& operator=(Model model) = delete;

private:
	CUStr _LUStr;
	CUStr _LDStr;
	CUStr _RUStr;
	CUStr _RDStr;
	CUVbk _aVBlk;

	CUSbk _LUStrWlStBlk;
	CUSbk _LDStrWlStBlk;
	CUSbk _RUStrWlStBlk;
	CUSbk _RDStrWlStBlk;
	CUVbk _aVBlkWlStBlk;

	CUSbk _LUStrDiStBlk;
	CUSbk _LDStrDiStBlk;
	CUSbk _RUStrDiStBlk;
	CUSbk _RDStrDiStBlk;
	CUVbk _aVBlkDiStBlk;

};

typedef std::shared_ptr<Model> CSModel;
typedef std::vector<std::shared_ptr<Model>> CVSModel;

#define CMSModel std::make_shared<Model>

#endif /* Model_hpp */
