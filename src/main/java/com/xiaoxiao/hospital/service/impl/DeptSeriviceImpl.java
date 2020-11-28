package com.xiaoxiao.hospital.service.impl;

import com.xiaoxiao.hospital.dao.DeptMapper;
import com.xiaoxiao.hospital.pojo.Dept;
import com.xiaoxiao.hospital.pojo.DeptExample;
import com.xiaoxiao.hospital.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xiaoxiao on 2017/11/17.
 */
@Service
public class DeptSeriviceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> getList() {
        List<Dept> depts = deptMapper.selectByExample(new DeptExample());
        return depts;
    }

    @Override
    public List<Dept> getListByGrade(Integer grade) {
        DeptExample deptExample = new DeptExample();
        deptExample.createCriteria().andDegradeEqualTo(grade);
        List<Dept> depts = deptMapper.selectByExample(deptExample);
        return depts;
    }
}
