package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.Teacher;
import HRBUST_ClassNetwork23_1.util.PageBean;

import java.util.List;
import java.util.Map;

public interface TeacherService
{
    PageBean<Teacher> queryPage(Map<String, Object> paramMap);

    int deleteTeacher(List<Integer> ids);

    int addTeacher(Teacher teacher);

    Teacher findById(Integer tid);

    int editTeacher(Teacher teacher);

    Teacher findByTeacher(Teacher teacher);

    int editPswdByTeacher(Teacher teacher);
}
