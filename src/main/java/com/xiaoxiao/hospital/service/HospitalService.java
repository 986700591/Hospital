package com.xiaoxiao.hospital.service;

import com.xiaoxiao.hospital.dto.DoctorPage;
import com.xiaoxiao.hospital.dto.HospitalPage;
import com.xiaoxiao.hospital.pojo.Doctor;
import com.xiaoxiao.hospital.pojo.Hospital;
import com.xiaoxiao.hospital.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface HospitalService {

    Page getPageData(Integer times, Integer insurance, String name, Integer grade, Integer pageNum, Integer pageSize);

    Integer totalCount();

    Integer selectToPageTotalCount(HospitalPage hospitalPage);

    Hospital getHospitalById(Long hid);

    List<Hospital> getList();

    List<Hospital> getListByTop3();
}
