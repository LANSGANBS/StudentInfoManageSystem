package HRBUST_ClassNetwork23_1.service;

import HRBUST_ClassNetwork23_1.domain.Admin;

public interface AdminService
{

    Admin findByAdmin(Admin admin);


    int editPswdByAdmin(Admin admin);
}
