package com.xiaoxiao.hospital.service.impl;

import com.xiaoxiao.hospital.dao.AdminMapper;
import com.xiaoxiao.hospital.pojo.AdminCustom;
import com.xiaoxiao.hospital.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;


	//管理员注册
	@Override
	public AdminCustom login(AdminCustom adminCustom) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.login(adminCustom);
	}

//	//统计投票项总数
//	@Override
//	public Integer votecount() throws Exception {
//		// TODO Auto-generated method stub
//		return voteitemMapper.getRecordcount();
//	}
//
//	//统计今日发布投票项总数
//	@Override
//	public Integer releasedToday() throws Exception {
//		// TODO Auto-generated method stub
//		return voteitemMapper.getReleasedTodayRecordcount();
//	}
//
//	//统计二级分类总数
//	@Override
//	public Integer cscount() throws Exception {
//		// TODO Auto-generated method stub
//		return categorysecondMapper.getRecordcount();
//	}
}
