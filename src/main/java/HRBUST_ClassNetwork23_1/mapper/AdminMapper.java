package HRBUST_ClassNetwork23_1.mapper;

import HRBUST_ClassNetwork23_1.domain.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper
{

    Admin findByAdmin(Admin admin);


    int editPswdByAdmin(Admin admin);
}
