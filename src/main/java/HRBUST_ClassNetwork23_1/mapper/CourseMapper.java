package HRBUST_ClassNetwork23_1.mapper;

import HRBUST_ClassNetwork23_1.domain.Course;

import java.util.List;
import java.util.Map;

public interface CourseMapper
{
    List<Course> queryList(Map<String, Object> paramMap);

    Integer queryCount(Map<String, Object> paramMap);

    int addCourse(Course course);

    int editCourse(Course course);

    int deleteCourse(List<Integer> ids);

    int addStudentNum(Integer courseId);

    void deleteStudentNum(Integer courseId);

    List<Course> getCourseById(List<Integer> ids);

    int findByName(String name);
}
