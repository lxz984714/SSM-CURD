package cn.kgc.crud.service.Impl;

import cn.kgc.crud.entity.Department;
import cn.kgc.crud.mapper.DepartmentMapper;
import cn.kgc.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssm-crud->DepartmentServiceImpl
 * @description: 部门业务类
 * @author: 林鑫哲
 * @create: 2019-11-28 23:27
 **/
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    /**
     *查询部门表
     */
    @Override
    public List<Department> getDepartmentList() {
        return departmentMapper.selectByExample(null);
    }
}
