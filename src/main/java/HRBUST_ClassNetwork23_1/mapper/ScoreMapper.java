package HRBUST_ClassNetwork23_1.mapper;

import HRBUST_ClassNetwork23_1.domain.Score;
import HRBUST_ClassNetwork23_1.domain.ScoreStats;

import java.util.List;
import java.util.Map;

public interface ScoreMapper
{
    List<Score> queryList(Map<String, Object> paramMap);

    Integer queryCount(Map<String, Object> paramMap);

    int addScore(Score score);

    Score isScore(Score score);

    int editScore(Score score);

    int deleteScore(Integer id);

    List<Score> getAll(Score score);

    ScoreStats getAvgStats(Integer courseid);
}
