package com.xiaoxiao.hospital.service;

import com.xiaoxiao.hospital.dto.DoctorPage;
import com.xiaoxiao.hospital.pojo.Dept;
import com.xiaoxiao.hospital.pojo.Doctor;
import com.xiaoxiao.hospital.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface DeptService {

    List<Dept> getList();

    List<Dept> getListByGrade(Integer grade);



}
