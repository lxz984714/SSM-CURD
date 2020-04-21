package cn.kgc.crud.test;

import cn.kgc.crud.entity.Department;
import cn.kgc.crud.entity.Employee;
import cn.kgc.crud.mapper.DepartmentMapper;
import cn.kgc.crud.mapper.EmployeeMapper;
import cn.kgc.crud.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * User: 林鑫哲
 * Date: 2019/11/25 0025
 * Time: 23:18
 */
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MybatisTest {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Test
    public void testCrud(){
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null,uuid, "M", uuid+"@163.com", 1));
        }
    }
    @Test
    public void testCrudTwo(){
      departmentMapper.insertSelective(new Department(null,"资源部"));

    }


   /* *
     * 描述:查询
     * @Date: 2019/11/26 0026 11:45
     */
//    @Test
//    public void testSelectOne(){
//        List<EmployeeExample.Criteria> criteria =new ArrayList<EmployeeExample.Criteria>();
//        EmployeeExample employeeExample=new EmployeeExample();
//        EmployeeExample.Criteria criteria1 = new EmployeeExample().createCriteria().andEmpNameEqualTo("dc0bf");
////        employeeExample.setOrderByClause("emp_id");
//
//        List<Employee> employees = employeeMapper.selectByExample(employeeExample);
//        for (Employee employee1 : employees) {
//            System.out.println("employee1 = " + employee1);
//        }
//
//    }



    /**
     * 描述:查询
     * @Date: 2019/11/26 0026 11:45
     */
    @Test
    public void testSelect(){
        List<Employee> employees = employeeMapper.selectByExample(null);
        for (Employee employee : employees) {
            System.out.println("employee = " + employee);
        }
    }


    /**
     * 描述:查询
     * @Date: 2019/11/26 0026 11:45
     */
    @Test
    public void testSelect01(){
        List<Employee> employeeList = employeeService.getEmployeeList();
        for (Employee employee : employeeList) {
            System.out.println(employee.toString()+employee.getDepartment().getDeptName());
        }

    }


    /**
     * 描述:两表查询
     * @Date: 2019/11/26 0026 13:22
     */
    @Test
    public void testSelect1(){
        Employee employee1 = employeeMapper.selectByPrimaryKeyWithDept(999);
        System.out.println(employee1.getEmpName()+employee1.getDepartment().getDeptName());
    }

    /**
     * 描述:删除
     * @Date: 2019/11/26 0026 11:46
     */

    @Test
    public void testdelete(){
       employeeMapper.deleteByPrimaryKey(1000);
    }
    /**
     * 描述:修改
     * @Date: 2019/11/26 0026 11:48
     */

    @Test
    public void testUpdate(){
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        String uuid = UUID.randomUUID().toString().substring(0, 5);
        mapper.updateByPrimaryKeySelective(new Employee(999,uuid, "GGGMMM", uuid+"@163.com", 2));
    }
}
