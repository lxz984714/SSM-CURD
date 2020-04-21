package cn.kgc.crud.test;

import cn.kgc.crud.entity.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

/**
 * @program: ssm-crud->EmployeeTest
 * @description: 测试sping 员工表后端
 * @author: 林鑫哲
 * @create: 2019-11-26 23:55
 **/
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class EmployeeTest {
    @Autowired
    /**
     * 加载applicationContext.xml
     */
    WebApplicationContext context;
    /**
     * MockMvc对我们的系统的Controller进行单元测试。
     */
    MockMvc mockMvc;
    /*
     * 功能描述:初始化 MockMvc  @Before在方法之前执行
     *        @Param: []
            * @Return: void
            * @Author: 林鑫哲
            * @Date: 2019/11/27 0027 0:21
     */
        @Before
    public void initMock(){
        mockMvc= webAppContextSetup(context).build();
    }

    /**
     * 功能描述: 模拟
     *        @Param:
            * @Return:
            * @Author: 林鑫哲
            * @Date: 2019/11/27 0027 0:30
     */
    @Test
    public void testGetEmployeeList() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/employee/getEmployeeList").param("pageNum", "1")).andReturn();
        //模拟结果中的请求
        MockHttpServletRequest request = result.getRequest();
        //请求域中会有pageInfo对象,提取出来并验证
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码 = " + pageInfo.getPageNum());
        System.out.println("总页数 = " + pageInfo.getPages());
        System.out.println("总记录数 = " + pageInfo.getTotal());
        //模拟显示页码
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            System.out.println("页码:"+num);
        }
        //模拟显示数据
        List<Employee> employeeList = pageInfo.getList();
        for (Employee employee : employeeList) {
            System.out.println("员工姓名:"+employee.getEmpName()+"员工部门"+employee.getDepartment().getDeptId());
        }
    }
}
