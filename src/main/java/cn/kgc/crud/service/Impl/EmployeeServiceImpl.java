package cn.kgc.crud.service.Impl;

import cn.kgc.crud.entity.Employee;
import cn.kgc.crud.entity.EmployeeExample;
import cn.kgc.crud.mapper.EmployeeMapper;
import cn.kgc.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssm-crud->EmployeeServiceImpl
 * @description: 员工的业务逻辑层接口实现类
 * @author: 林鑫哲
 * @create: 2019-11-26 23:05
 **/
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 获取员工表
     * @return
     */
    @Override
    public List<Employee> getEmployeeList() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 添加
     * @param employee
     */
    @Override
    public void addEmployee(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检验用户名是否可用
     * @param empName  如果记录数等于0 等于true 代表当前的名字可用 否者不可用
     * @return
     */
    @Override
    public boolean getcheckUse(String empName) {
        EmployeeExample example =new EmployeeExample();
        example.createCriteria().andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Override
    public Employee getEmpList(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * 根据注解id 修改
     * @param employee
     */
    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 根据id单个删除
     * @param id
     */
    @Override
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
    /**
     * 批量删除
     * @param ids
     */
    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample() ;
        /*delete from xxx where emp_id in(1,2,3)*/
        example.createCriteria().andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);

    }




}
