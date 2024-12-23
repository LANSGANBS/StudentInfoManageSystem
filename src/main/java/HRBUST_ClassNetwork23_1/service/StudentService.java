package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.Student;
import HRBUST_ClassNetwork23_1.util.PageBean;

import java.util.List;
import java.util.Map;

public interface StudentService
{
    PageBean<Student> queryPage(Map<String, Object> paramMap);

    int deleteStudent(List<Integer> ids);

    int addStudent(Student student);

    Student findById(Integer sid);

    int editStudent(Student student);

    Student findByStudent(Student student);

    boolean isStudentByClazzId(Integer next);

    int editPswdByStudent(Student student);

    int findByName(String username);
}
