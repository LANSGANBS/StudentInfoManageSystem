package HRBUST_ClassNetwork23_1.interceptors;

import HRBUST_ClassNetwork23_1.domain.Admin;
import HRBUST_ClassNetwork23_1.domain.Student;
import HRBUST_ClassNetwork23_1.domain.Teacher;
import HRBUST_ClassNetwork23_1.util.Const;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor
{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException
    {
        Admin user = (Admin) request.getSession().getAttribute(Const.ADMIN);
        Teacher teacher = (Teacher) request.getSession().getAttribute(Const.TEACHER);
        Student student = (Student) request.getSession().getAttribute(Const.STUDENT);
        if (!StringUtils.isEmpty(user) || !StringUtils.isEmpty(teacher) || !StringUtils.isEmpty(student))
        {
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/system/login");
        return false;
    }

}
