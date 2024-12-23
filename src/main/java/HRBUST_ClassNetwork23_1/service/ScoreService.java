package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.Score;
import HRBUST_ClassNetwork23_1.domain.ScoreStats;
import HRBUST_ClassNetwork23_1.util.PageBean;

import java.util.List;
import java.util.Map;

public interface ScoreService
{
    PageBean<Score> queryPage(Map<String, Object> paramMap);

    boolean isScore(Score score);

    int addScore(Score score);

    int editScore(Score score);

    int deleteScore(Integer id);

    List<Score> getAll(Score score);

    ScoreStats getAvgStats(Integer courseid);
}
