package HRBUST_ClassNetwork23_1.controller;

import HRBUST_ClassNetwork23_1.domain.Admin;
import HRBUST_ClassNetwork23_1.domain.Student;
import HRBUST_ClassNetwork23_1.domain.Teacher;
import HRBUST_ClassNetwork23_1.service.AdminService;
import HRBUST_ClassNetwork23_1.service.StudentService;
import HRBUST_ClassNetwork23_1.service.TeacherService;
import HRBUST_ClassNetwork23_1.util.AjaxResult;
import HRBUST_ClassNetwork23_1.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/system")
public class SystemController
{

    @Autowired
    private AdminService adminService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @GetMapping("/login")
    public String login()
    {
        return "/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult submitlogin(String username, String password, HttpSession session)
    {
        AjaxResult ajaxResult = new AjaxResult();
        if (StringUtils.isEmpty(username))
        {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("请填写用户名");
            return ajaxResult;
        }
        if (StringUtils.isEmpty(password))
        {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("请填写密码");
            return ajaxResult;
        }
        Admin admin = new Admin();
        admin.setPassword(password);
        admin.setUsername(username);
        Admin ad = adminService.findByAdmin(admin);
        if (StringUtils.isEmpty(ad))
        {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("用户名或密码错误");
            return ajaxResult;
        }
        ajaxResult.setSuccess(true);
        session.setAttribute(Const.ADMIN, ad);
        session.setAttribute(Const.USERTYPE, "1");
        return ajaxResult;
    }

    @GetMapping("/index")
    public String index()
    {
        return "/system/index";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session)
    {
        session.invalidate();
        return "/login";
    }

    @RequestMapping("/getPhoto")
    @ResponseBody
    public AjaxResult getPhoto(@RequestParam(value = "sid", defaultValue = "0") Integer sid,
                               @RequestParam(value = "tid", defaultValue = "0") Integer tid)
    {
        AjaxResult ajaxResult = new AjaxResult();
        if (sid != 0)
        {
            Student student = studentService.findById(sid);
            ajaxResult.setImgurl(student.getPhoto());
            return ajaxResult;
        }
        if (tid != 0)
        {
            Teacher teacher = teacherService.findById(tid);
            ajaxResult.setImgurl(teacher.getPhoto());
            return ajaxResult;
        }
        return ajaxResult;
    }

    @GetMapping("/personalView")
    public String personalView()
    {
        return "/system/personalView";
    }

    @PostMapping("/editPassword")
    @ResponseBody
    public AjaxResult editPassword(String password, String newpassword, HttpSession session)
    {
        AjaxResult ajaxResult = new AjaxResult();
        Admin admin = (Admin) session.getAttribute(Const.ADMIN);
        if (!password.equals(admin.getPassword()))
        {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("原密码错误");
            return ajaxResult;
        }
        admin.setPassword(newpassword);
        try
        {
            int count = adminService.editPswdByAdmin(admin);
            if (count > 0)
            {
                ajaxResult.setSuccess(true);
                ajaxResult.setMessage("修改成功,请重新登录");
            }
            else
            {
                ajaxResult.setSuccess(false);
                ajaxResult.setMessage("修改失败");
            }
        } catch (Exception e)
        {
            e.printStackTrace();
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("修改失败");
        }
        return ajaxResult;
    }
}