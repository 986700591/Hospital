package com.xiaoxiao.hospital.service.impl;

import com.xiaoxiao.hospital.dao.AppointmentMapper;
import com.xiaoxiao.hospital.pojo.Appointment;
import com.xiaoxiao.hospital.pojo.AppointmentExample;
import com.xiaoxiao.hospital.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xiaoxiao on 2017/11/17.
 */
@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Autowired
    private AppointmentMapper appointmentMapper;
    @Override
    public Integer selectTimesFromHospital(Long hid) {
        Integer integer = appointmentMapper.selectTimesFromHospital(hid);
        return integer;
    }

    @Override
    public Boolean save(Appointment appointment) {
        try{
            appointmentMapper.insert(appointment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public List<Appointment> listAll() {
        List<Appointment> appointments = appointmentMapper.selectByExample(new AppointmentExample());
        return appointments;
    }


}
