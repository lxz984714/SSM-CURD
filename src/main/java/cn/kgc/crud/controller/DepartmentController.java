package cn.kgc.crud.controller;

import cn.kgc.crud.domain.Response;
import cn.kgc.crud.entity.Department;
import cn.kgc.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: ssm-crud->DepartmentController
 * @description: 部门控制层
 * @author: 林鑫哲
 * @create: 2019-11-28 23:23
 **/
@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    /**
    * @Description:查找部门表
    * @return:
    * @Author:林鑫哲
    * @Date: 2019/11/28 0028
    */
    @ResponseBody
    @GetMapping("/getDeptList")
    public Response getDeptList(){
      List<Department> departmentList= departmentService.getDepartmentList();
      return Response.success().add("departmentList",departmentList);
    }
}
