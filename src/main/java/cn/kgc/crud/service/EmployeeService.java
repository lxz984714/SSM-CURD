package cn.kgc.crud.service;

import cn.kgc.crud.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: ssm-crud->EmployeeService
 * @description: ${description}
 * @author: 林鑫哲
 * @create: 2019-11-26 23:03
 **/
public interface EmployeeService {
    /**
     * 功能描述:获取员工表
     * @Param:
            * @Return: void
            * @Author: 林鑫哲
            * @Date: 2019/11/26 0026 23:10
     */
    List<Employee> getEmployeeList();

    /**
     * 添加
     * @param employee
     */
    void addEmployee(Employee employee);

    /**
     * 检验用户名是否可用
     * @param empName
     * @return
     */
    boolean getcheckUse(String empName);

    /**
     * 按照员工id 查询出员工
     * @param id
     * @return
     */
    Employee getEmpList(Integer id);

    /**
     * 修改
     * @param employee
     */
    void updateEmp(Employee employee);

    /**
     * 单个删除
     * @param id
     */
    void deleteEmp(@Param("id") Integer id);

    /**
     * 批量删除
     * @param ids
     */
    void deleteBatch(@Param("ids") List<Integer> ids);
}
