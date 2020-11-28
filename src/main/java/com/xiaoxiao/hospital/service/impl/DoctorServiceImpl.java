package com.xiaoxiao.hospital.service.impl;

import com.xiaoxiao.hospital.dao.DoctorMapper;
import com.xiaoxiao.hospital.dto.DoctorPage;
import com.xiaoxiao.hospital.pojo.Doctor;
import com.xiaoxiao.hospital.pojo.DoctorExample;
import com.xiaoxiao.hospital.pojo.Page;
import com.xiaoxiao.hospital.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xiaoxiao on 2017/11/17.
 */
@Service
public class DoctorServiceImpl implements DoctorService  {
    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public List<Doctor> getListByGrade(Integer grade) {
        DoctorExample doctorExample = new DoctorExample();
        doctorExample.createCriteria().andGradeEqualTo(grade);
        return doctorMapper.selectByExample(doctorExample);
    }

    @Override
    public List<Doctor> getListByDept(Long did) {
        DoctorExample doctorExample = new DoctorExample();
        doctorExample.createCriteria().andDeidEqualTo(did);
        return null;
    }

    @Override
    public List<Doctor> getList() {
        return doctorMapper.selectByExample(new DoctorExample());
    }

    @Override
    public Page<Doctor> selectToPage(DoctorPage doctorPage) {
        Page <Doctor> page = new Page<>();
        Integer pageNum = doctorPage.getPageNum();
        doctorPage.setPageNum((pageNum - 1) * doctorPage.getPageSize());
        List<Doctor>  list = doctorMapper.selectToPage(doctorPage);

        page.setData(list);
        page.setPageNum(pageNum);
        page.setPageSize(doctorPage.getPageSize());
        Integer totalCount = doctorMapper.selectToPageTotalCount(doctorPage);
        page.setTotalCount(totalCount);
        page.setTotalPage((int)Math.ceil( totalCount*1.0/page.getPageSize() ));

        return page;
    }

    @Override
    public Doctor selectById(Long id) {
        return  doctorMapper.selectById(id);
    }

    @Override
    public List<Doctor> getListByTop4() {

        return  doctorMapper.getListByTop4();
    }

}
