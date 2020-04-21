package cn.kgc.crud.service;

import cn.kgc.crud.entity.Department;

import java.util.List;

/**
 * @program: ssm-crud->DepartmentService
 * @description:
 * @author: 林鑫哲
 * @create: 2019-11-28 23:25
 **/
public interface DepartmentService {
    /**
     *查询部门表
     */
    List<Department> getDepartmentList();
}
