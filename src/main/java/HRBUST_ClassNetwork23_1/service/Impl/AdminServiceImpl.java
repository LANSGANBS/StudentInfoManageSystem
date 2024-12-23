package HRBUST_ClassNetwork23_1.service.Impl;

import HRBUST_ClassNetwork23_1.domain.Admin;
import HRBUST_ClassNetwork23_1.mapper.AdminMapper;
import HRBUST_ClassNetwork23_1.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService
{

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin findByAdmin(Admin admin)
    {
        return adminMapper.findByAdmin(admin);
    }

    @Override
    public int editPswdByAdmin(Admin admin)
    {
        return adminMapper.editPswdByAdmin(admin);
    }

}
