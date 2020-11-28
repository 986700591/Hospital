package com.xiaoxiao.hospital.web;
import java.util.Date;
import javax.servlet.http.HttpSession;
import com.xiaoxiao.hospital.pojo.AdminCustom;
import com.xiaoxiao.hospital.service.AdminService;
import com.xiaoxiao.hospital.utils.MySQLDatabaseBackup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    //��ת����¼ҳ��
    @RequestMapping("")
    public String adminLoginPage() throws Exception{
        return "admin/login";
    }

    //��ת����ҳ
    @RequestMapping("index")
    public String index(Model model,HttpSession session)throws Exception{
        if (session.getAttribute("existAdmin") != null) {
            return "admin/index";
        } else {
            model.addAttribute("loginerror", "���¼");
            return "admin/login";
        }

    }

    //��ת��ͳ��ҳ��
    @RequestMapping("/siteInfo")
    public String siteInfo(Model model)throws Exception{
//        Integer votecount = adminService.votecount();
//        Integer releasedTodayCount =adminService.releasedToday();
//        Integer cscount =adminService.cscount();
//        model.addAttribute("votecount", votecount);
//        model.addAttribute("releasedTodayCount", releasedTodayCount);
//        model.addAttribute("cscount", cscount);
        return "admin/siteInfo";
    }

    //��¼
    @RequestMapping("/adminlogin")
    public String adminlogin(Model model ,HttpSession session,AdminCustom adminCustom)throws Exception{
        AdminCustom existAdmin = adminService.login(adminCustom);
        if(existAdmin!=null){
            session.setAttribute("existAdmin", existAdmin);
            return "redirect:index";
        }else{
            model.addAttribute("loginerror", "�û������������");
            return "admin/login";
        }
    }

    //���ݿⱸ��
    @RequestMapping("/dateBaseSave")
    public String dateBaseSave(Model model) throws Exception{
        Date date = new Date();
        String dateBaseName = String.valueOf(date.getYear()+1900)+"-"+String.valueOf(date.getMonth()+1)+"-"+String.valueOf(date.getDate())+"_vote.sql";
        try {
            if (MySQLDatabaseBackup.exportDatabaseTool("47.112.196.80", "root", "520zyjLOVE..", "/home/apache-tomcat-6.0.14/sqlfile", dateBaseName, "vote")) {
                model.addAttribute("dateBaseSaveMessage", "���ݿⱸ�ݳɹ�������");
            } else {
                model.addAttribute("dateBaseSaveMessage", "���ݿⱸ��ʧ�ܣ�����");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "admin/datebasesavemessage";

    }

    //ע��
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:";
    }
}
