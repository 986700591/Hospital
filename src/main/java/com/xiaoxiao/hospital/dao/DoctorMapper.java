package com.xiaoxiao.hospital.dao;

import com.xiaoxiao.hospital.dto.DoctorPage;
import com.xiaoxiao.hospital.pojo.Doctor;
import com.xiaoxiao.hospital.pojo.DoctorExample;
import java.util.List;

import com.xiaoxiao.hospital.pojo.Page;
import org.apache.ibatis.annotations.Param;

public interface DoctorMapper {
    int countByExample(DoctorExample example);

    int deleteByExample(DoctorExample example);

    int deleteByPrimaryKey(Long did);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    List<Doctor> selectByExample(DoctorExample example);

    Doctor selectByPrimaryKey(Long did);

    int updateByExampleSelective(@Param("record") Doctor record, @Param("example") DoctorExample example);

    int updateByExample(@Param("record") Doctor record, @Param("example") DoctorExample example);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

    List<Doctor> selectToPage(DoctorPage doctorPage);

    Integer selectToPageTotalCount(DoctorPage doctorPage);

    Doctor selectById(Long id);

    List <Doctor> getListByTop4();
}