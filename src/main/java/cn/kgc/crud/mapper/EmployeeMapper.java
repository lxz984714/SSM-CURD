package cn.kgc.crud.mapper;

import cn.kgc.crud.entity.Employee;
import cn.kgc.crud.entity.EmployeeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);
    int deleteByExample(EmployeeExample example);
    int deleteByPrimaryKey(Integer empId);
    //有主键id
    int insert(Employee record);
    //没主键id
    int insertSelective(Employee record);
    //没关联主键id
    List<Employee> selectByExample(EmployeeExample example);
    //有关联主键id
    Employee selectByPrimaryKey(Integer empId);
    //有关联主键 id关联部门表
    Employee selectByPrimaryKeyWithDept(Integer empId);
    //没关联主键id 关联部门表
    List<Employee> selectByExampleWithDept(EmployeeExample example);


    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);
    //修改有主键id
    int updateByPrimaryKeySelective(Employee record);
    //修改没主键id
    int updateByPrimaryKey(Employee record);
}