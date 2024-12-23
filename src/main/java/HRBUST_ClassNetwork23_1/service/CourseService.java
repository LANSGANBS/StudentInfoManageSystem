package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.Course;
import HRBUST_ClassNetwork23_1.util.PageBean;

import java.util.List;
import java.util.Map;

public interface CourseService
{
    PageBean<Course> queryPage(Map<String, Object> paramMap);

    int addCourse(Course course);

    int editCourse(Course course);

    int deleteCourse(List<Integer> ids);

    List<Course> getCourseById(List<Integer> ids);

    int findByName(String name);
}
