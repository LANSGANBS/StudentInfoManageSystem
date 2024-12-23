package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.SelectedCourse;
import HRBUST_ClassNetwork23_1.util.PageBean;

import java.util.List;
import java.util.Map;

public interface SelectedCourseService
{
    PageBean<SelectedCourse> queryPage(Map<String, Object> paramMap);

    int addSelectedCourse(SelectedCourse selectedCourse);

    int deleteSelectedCourse(Integer id);

    boolean isStudentId(int id);

    List<SelectedCourse> getAllBySid(int studentid);
}
