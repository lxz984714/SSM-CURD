package cn.kgc.crud.controller;


import cn.kgc.crud.domain.Response;
import cn.kgc.crud.entity.Employee;
import cn.kgc.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ssm-crud->EmployeeController
 * @description: 员工的控制层
 * @author: 林鑫哲
 * @create: 2019-11-26 22:39
 **/
@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * 功能描述:获取员工列表 并分页 用视图返回数据
     *
     * @Param:
     * @Return: java.lang.String
     * @Author: 林鑫哲
     * @Date: 2019/11/26 0026 23:15
     */
    //defaultValue默认值是1
    @RequestMapping("/getEmployeeList")
    public String getEmployeeList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model) {
        //PageHelper分页的插件 startPage当前页  pageNum当前页页码  pageSize 每页显示数量
        PageHelper.startPage(pageNum, 5);
        List<Employee> employeeList = employeeService.getEmployeeList();
        //把查出来的数据用分页显示出来
        PageInfo pageInfo = new PageInfo(employeeList, 7);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }


    /**
     * @Description:用JSON返回数据
     * @Author:林鑫哲
     * @Date: 2019/11/27 0027
     */
    @ResponseBody
    @RequestMapping("/getEmployeeListJson")
    public Response getEmployeeListByJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //PageHelper分页的插件 startPage当前页  pageNum当前页页码  pageSize 每页显示数量
        PageHelper.startPage(pageNum, 5);
        List<Employee> employeeList = employeeService.getEmployeeList();
        //把查出来的数据用分页显示出来
        PageInfo pageInfo = new PageInfo(employeeList, 7);
        return Response.success().add("pageInfo", pageInfo);
    }


    /**
     * 员工保存
     * 后端数据校验
     * 1.支持JSR303校验
     * hibernate-validator JSR303校验
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @PostMapping("/addEmp")
//    @RequestMapping(value = "/addEmp", method = RequestMethod.POST)
    public Response addEmp(@Valid Employee employee, BindingResult result, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
       /* String idPicPath = null;
        //判断文件不为空
        if (!file.isEmpty()) {
            //获取上传目标路径
            String path = request.getSession().getServletContext().getRealPath("static" + File.separator + "upLoadFiles");
            File filePath = new File(path);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            //获取源文件名
            String oldFileName = file.getOriginalFilename();
            //获取后缀
            String suffix = FilenameUtils.getExtension(oldFileName);
            //判断文件大小
            if (file.getSize() > 500000000) {
                request.setAttribute("fileUpLoadError", " * 文件不能超过5MB");
                return Response.success();
            } else if (suffix.equalsIgnoreCase("jpg") ||
                    suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("png")
                    || suffix.equalsIgnoreCase("gif")) {
                //定义新的文件名
                String newFileName = System.currentTimeMillis() + "_Person";
                File targetName = new File(path, newFileName);
                if (!targetName.exists()) {
                    targetName.mkdirs();
                }
                try {
                    file.transferTo(targetName);

                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("fileUpLoadError", "* 上传失败");
                    return Response.success();
                }
                idPicPath = path + File.separator + newFileName;
            } else {
                request.setAttribute("fileUpLoadError", "* 文件格式不正确");
                return Response.success();
            }
        }
*/
        Map<String, Object> map = new   HashMap<>();
        if (result.hasErrors()) {
            //校验失败,应该返回失败,在模态框中显示校验失败的错误信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误的字段 = " + fieldError.getField());
                System.out.println("错误的信息 = " + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Response.fail().add("errorFields", map);
        } else {

//            employee.setIdPicPath(idPicPath);
            employeeService.addEmployee(employee);
            System.out.println("employee = " + employee);
            return Response.success();
        }

    }


    /**
     * 验证用户名是否一致
     */
    @ResponseBody
    @PostMapping("/checkUse")
    public Response checkUse(@RequestParam("empName") String empName) {
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)) {
            return Response.fail().add("va_msg", "用户名必须是2-5位中文或者6-16位英文和数字的组合");
        }
        //数据库用户名重复校验
        boolean b = employeeService.getcheckUse(empName);
        if (b) {
            return Response.success();
        } else {
            return Response.fail().add("va_msg", "用户名不可用");
        }
    }


    /**
     * 修改 先查询出员工 根据id查询员工
     */
//    PathVariable代表从请求传来的id
    @ResponseBody
    @GetMapping("/getEmp/{id}")
    public Response getEmp(@PathVariable("id") Integer id) {
        Employee empList = employeeService.getEmpList(id);
        return Response.success().add("emp", empList);

    }

    /**
     * 修改员工
     */
    @ResponseBody
    @PutMapping("/saveEmp/{empId}")
    public Response saveEmp(Employee employee) {
        System.out.println("employee = " + employee);
        employeeService.updateEmp(employee);
        return Response.success();
    }


    /**
     * 删除员工 单个批量
     */
  /*  @ResponseBody
    @DeleteMapping("/deleteEmp/{id}")
    public Response deleteEmp(@PathVariable("id") Integer id) {
        employeeService.deleteEmp(id);
        return Response.success();
    }*/

    /**
     * 删除员工 批量删除 1-2-3  单个删除 1
     * contains包含的意思
     */
    @ResponseBody
    @DeleteMapping("/deleteEmpById/{ids}")
    public Response deleteEmpById(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            //多个删除   组装id的集合
            //判断是否包含 -
            List<Integer> del_ids = new ArrayList<Integer>();
            String[] split = ids.split("-");
            //遍历数组封装到集合中
            for (String sp : split) {
                del_ids.add(Integer.parseInt(sp));
            }

            System.out.println("ids = " + ids);
            employeeService.deleteBatch(del_ids);
        } else {
            //String强壮为int类型
            Integer id = Integer.parseInt(ids);
            System.out.println("id = " + id);
            //单击删除
            employeeService.deleteEmp(id);
        }

        return Response.success();
    }

    /**
     * 单文件上传
     *
     * @param employee
     * @param file
     * @return
     */
//        文件上传  file是前端传来的路劲
   /* @ResponseBody
    @PostMapping("/upLoadFile")
    public Response upLoadFile(@Valid Employee employee, BindingResult result, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {

        String idPicPath = null;
        //判断文件不为空
        if (!file.isEmpty()) {
            //获取上传目标路径
            String path = request.getSession().getServletContext().getRealPath("static" + File.separator + "upLoadFiles");
            File filePath = new File(path);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            //获取源文件名
            String oldFileName = file.getOriginalFilename();
            //获取后缀
            String suffix = FilenameUtils.getExtension(oldFileName);
            //判断文件大小
            if (file.getSize() > 50000000) {
                request.setAttribute("fileUpLoadError", " * 文件不能超过5MB");
                return Response.success();
            } else if (suffix.equalsIgnoreCase("jpg") ||
                    suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("png")
                    || suffix.equalsIgnoreCase("gif")) {
                //定义新的文件名
                String newFileName = System.currentTimeMillis() + "_Person";
                File targetName = new File(path, newFileName);
                if (!targetName.exists()) {
                    targetName.mkdirs();
                }
                try {
                    file.transferTo(targetName);

                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("fileUpLoadError", "* 上传失败");
                    return Response.success();
                }
                idPicPath = path + File.separator + newFileName;
            } else {
                request.setAttribute("fileUpLoadError", "* 文件格式不正确");
                return Response.success();
            }
            //判断格式


        }
    }*/
}

