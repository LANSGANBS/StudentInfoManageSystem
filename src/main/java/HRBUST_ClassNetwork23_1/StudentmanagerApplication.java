package HRBUST_ClassNetwork23_1;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("HRBUST_ClassNetwork23_1.mapper")
@SpringBootApplication()
public class StudentmanagerApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(StudentmanagerApplication.class, args);
    }
}