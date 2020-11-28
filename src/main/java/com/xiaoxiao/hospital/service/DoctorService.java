package com.xiaoxiao.hospital.service;

import com.xiaoxiao.hospital.dto.DoctorPage;
import com.xiaoxiao.hospital.pojo.Doctor;
import com.xiaoxiao.hospital.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface DoctorService {

    List<Doctor> getListByGrade(Integer grade);

    List<Doctor> getListByDept(Long dept);

    List<Doctor> getList();

    Page<Doctor> selectToPage(DoctorPage doctorPage);

    Doctor  selectById(Long id);

    List<Doctor> getListByTop4();
}
