<%--
   ajax异步验证数据
  User: 林鑫哲
  Date: 2019/11/27 0027
  Time: 1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%--引入jquery--%>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/emp.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          crossorigin="anonymous">
    <%--引入js--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--员工修改的模态框 start--%>
<!-- 员工添加的模态框 start-->
<div class="modal fade" id="Emp_UpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><h1>修改</h1></h4>
            </div>
            <%--添加数据 start--%>
            <div class="modal-body">
                <%--表单 start--%>
                <form class="form-horizontal">

                    <%-- 员工姓名 start--%>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名:</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>

                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="emp_add_input" class="col-sm-2 control-label">email:</label>
                        <div class="col-sm-10">
                            <input type="text" name="empEmail" class="form-control" id="Emp_Update_input"
                                   placeholder="请输入email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <%--员工性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender:</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="GenderOne_Update_input" value="M"
                                       checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="GenderTwo_Update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <%--部门--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="EmpDept_update"></select>
                        </div>
                    </div>
                    <%--部门结束--%>

                </form>
                <%--表单 end--%>
            </div>
            <%--添加数据 end--%>

            <%--关闭保存按钮 start--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update">更新</button>
            </div>
            <%--关闭保存按钮 end--%>
        </div>
    </div>
</div>
<%--员工修改的模态框 end--%>


<!-- 员工添加的模态框 start-->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"><h1>新增员工</h1></h4>
            </div>
            <%--添加数据 start--%>
            <div class="modal-body">
                <%--表单 start--%>
                <form class="form-horizontal"  enctype="multipart/form-data">

                    <%-- 员工姓名 start--%>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="添加姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="emp_add_input" class="col-sm-2 control-label">email:</label>
                        <div class="col-sm-10">
                            <input type="text" name="empEmail" class="form-control" id="emp_add_input"
                                   placeholder="请输入email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <%--员工性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender:</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="genderOne_add_input" value="M"
                                       checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="genderTwo_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <%--部门--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="empDept_add"></select>
                        </div>
                    </div>
                    <%--部门结束--%>
                    <div>
                        <input type="hidden" id="errorInfo" value="${fileUpLoadError}">
                        <label for="file">单文件上传</label>
                        <input type="file" name="file" id="file" value="">
                        <font color="red"></font>
                    </div>
                </form>
                <%--表单 end--%>
            </div>
            <%--添加数据 end--%>

            <%--关闭保存按钮 start--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add">保存</button>
            </div>
            <%--关闭保存按钮 end--%>
        </div>
    </div>
</div>
<%--员工添加结束 End--%>


<%--显示列表信息--%>
<div class="container">
    <%--显示标题--%>
    <div class="col-md-12">
        <h2>SSM-员工</h2>
    </div>
    <div class="row">

        <div class="col-md-4 col-md-offset-10">
            <form class="form-inline">
                <div class="form-group">
                    <label for="inputPassword2" class="sr-only">姓名</label>
                    <input type="text" class="form-control" id="inputPassword2" placeholder="请输入姓名">
                </div>
                <button type="submit" class="btn btn-info">查询</button>
            </form>



            <button class="btn btn-info glyphicon glyphicon-music" id="emp_add_btn">新增</button>
            <button class="btn btn-danger glyphicon glyphicon-book" id="emp_delete_btn">删除</button>
        </div>
    </div>
</div>


<%--员工列表--%>
<div class="col-md-12">
    <table class="table table-hover" id="page_info_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="cb_id">
            </th>
            <th>Id</th>
            <th>姓名</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>部门</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>


<%--分页信息--%>
<div class="col-md-12">
    <%-- 分页信息--%>
    <div class="col-md-6" id="page_info">
    </div>
    <%--   分页条     --%>
    <div class="col-md-6" id="page_nav">
    </div>
</div>


<%--当打开页面就发送ajax请求--%>
<script type="text/javascript">
    var last_page_Num, Num_pageNum;
    $(function () {
        to_page(1)
    });

    function to_page(pageNum) {
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/getEmployeeListJson",
            data: "pageNum=" + pageNum,
            type: "GET",
            success: function (result) {
                //1.显示员工信息
                build_emps_info(result);
                //2.显示分页信息
                build_page_info(result);
                //3.显示分页条
                build_page_nav(result)
            }
        });
    }

    //1.显示员工信息
    function build_emps_info(result) {
        $("#page_info_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        //遍历出结果,并赋值封装
        $.each(emps, function (index, item) {
            //alert(item.empName);
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/</td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.empGender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.empEmail);
            var deptNameTd = $("<td></td>").append(item.department.deptName);


            var editBtn = $("<button></button>").addClass("btn btn-success btn-sm update_btn").append("<span></apan>").addClass("glyphicon glyphicon-text-width").append("编辑").attr("update_id", item.empId);


            // editBtn.attr("update_id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-warning btn-sm delete_btn").append("<span></apan>").addClass("glyphicon glyphicon-trash").append("删除").attr("del_id", item.empId);

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#page_info_table tbody");
        })
    }


    //2.显示分页信息
    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append("当前在 " + result.extend.pageInfo.pageNum + " 页, 共 " + result.extend.pageInfo.pages + "页, 共 " + result.extend.pageInfo.total + " 条记录");
        last_page_Num = result.extend.pageInfo.pages;
        Num_pageNum = result.extend.pageInfo.pageNum;

    }

    //3.显示分页条
    function build_page_nav(result) {
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1)
            })
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled")
            lastPageLi.addClass("disabled")
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1)
            })
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }
        //添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);

        //页码
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            ul.append(numLi);
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            })
        })
        //添加后一页和末页
        ul.append(nextPageLi).append(lastPageLi);

        //把ul的标签添加到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }


    //清除表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();//重置内容
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //抽取验证名字和邮箱一样的参数
    function show_check_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success")
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error")
            $(ele).next("span").text(msg);
        }
    }


    function check__add_form() {
        //校验名字
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_check_msg(("#empName_add_input"), "error", "用户名必须是2-5位中文或者6-16位英文和数字的组合")
            /*   $("#empName_add_input").parent().addClass("has-error");
           $("#empName_add_input").next().text("用户名可以是2-5位中文或者6-16位英文和数字的组合");*/
            return false;
        } else {
            show_check_msg(("#empName_add_input"), "success", "")
            /*$("#empName_add_input").parent().addClass(" has-success");
            $("#empName_add_input").next().text("");*/
        }

        //2、校验邮箱信息
        var email = $("#emp_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_check_msg(("#emp_add_input"), "error", "邮箱格式不正确")
            /* $("#emp_add_input").parent().addClass("has-error");
             $("#emp_add_input").next().text("邮箱格式不正确");*/
            return false;
        } else {
            show_check_msg(("#emp_add_input"), "success", "")
            /*  $("#emp_add_input").parent().addClass("has-success");
              $("#emp_add_input").next().text("");*/
        }
        return true;
    }

    //点击新增按钮的时候跳到模态框
    $("#emp_add_btn").click(function () {
        //清除样式
        reset_form($("#empAddModel form"))
        //请求出部门列表下拉
        getDeptList("#empAddModel select");
        $('#empAddModel').modal({
            backdrop: "static"
        })

    })

    //保存事件
    $("#emp_add").click(function () {
        // 先校验表单在保存
        if (!check__add_form()) {
            return false;
        }
        //1.判断之前 ajax用户名是否校验成功.如果成功
        if ($(this).attr("ajax_v") == "error") {
            return false;
        }

       /* if($("#errorInfo").val()==null ||$("#errorInfo").val()==""){
            file.next().html(" *上传文件不得大于5MB *上传文件格式必须为:jpg,jpeg,png,gif")
        }else{
            file.next().html($("#r").val())
        }
        ;*/
        //2.发送ajax请求保存员工
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/addEmp",
            type: "post",
            data: $("#empAddModel form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    $('#empAddModel').modal('hide');
                    to_page(last_page_Num);
                    // alert(result)
                } else {
                    //显示失败信息
                    if (undefined != result.extend.errorFields.empEmail) {
                        show_check_msg($("#emp_add_input"), "error", result.extend.errorFields.empEmail);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_check_msg($("#empName_add_input"), "error", result.extend.errorFields.empName);
                    }
                }

            }
        })
    })

    //获取部门ajax查询事件
    function getDeptList(ele) {
        $(ele).empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/department/getDeptList",
            type: "GET",
            success: function (result) {
                $.each(result.extend.departmentList, function (index, dept) {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        });
    }


    //ajax验证用户名和数据库是否一致
        $("#empName_add_input").blur(function () {
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/checkUse",
            data: "empName=" + empName,
            type: "Post",
            success: function (result) {
                if (result.code == 100) {
                    show_check_msg(("#empName_add_input"), "success", "用户名可用")
                    $("#emp_add").attr("ajax_v", "success")
                } else {
                    show_check_msg(("#empName_add_input"), "error", result.extend.va_msg)
                    $("#emp_add").attr("ajax_v", "error")
                }
            }
        });
    });


    /*绑定点击编辑事件
    * 直接绑定click点击是绑定不上的
    * 所以创建按钮的时候绑定  绑定点击.live()
    * jquery新版没有live ,使用on替代
    * */

    $(document).on("click", ".update_btn", function () {
        //alert("add");

        //查出员工信息
        getEmp($(this).attr("update_id"));

        //1.先查出部门信息,并显示部门信息
        getDeptList("#Emp_UpdateModel select");
        //2.把员工的id传给模态框的更新按钮
        $("#emp_update").attr("update_id", $(this).attr("update_id"));
        $('#Emp_UpdateModel').modal({
            backdrop: "static"
        })
    });

    /* 查出员工信息,然后显示员工*/
    function getEmp(id) {

        $.ajax({
            url: "${pageContext.request.contextPath}/employee/getEmp/" + id,
            type: "GET",
            success: function (result) {
                // alert(result)
                var EmpEnyolee = result.extend.emp;
                $("#empName_update_static").text(EmpEnyolee.empName);
                $("#Emp_Update_input").val(EmpEnyolee.empEmail);
                $("#Emp_UpdateModel input[name=empGender]").val([EmpEnyolee.empGender]);
                $("#Emp_UpdateModel select").val([EmpEnyolee.deptId])
            }
        });
    }


    /*点击更新,更新员工信息*/
    $("#emp_update").click(function () {
        //验证邮箱是否合法
        //2、校验邮箱信息
        var email = $("#Emp_Update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_check_msg(("#Emp_Update_input"), "error", "邮箱格式不正确")
            return false;
        } else {
            show_check_msg(("#Emp_Update_input"), "success", "")
        }
        // 2.发送ajax请求保存更新员工的数据
        var dib_id =$(this).attr("update_id")
        $.ajax({
            url: "${pageContext.request.contextPath}/employee/saveEmp/" +dib_id ,
            type: "PUT",
            data: $("#Emp_UpdateModel form").serialize(),
            success: function (result) {
                $('#Emp_UpdateModel').modal('hide');
                to_page(Num_pageNum);

            }
        })
    })
    //.和#区别  .可以重复设置id的值  #只能设置一个唯一的id的值
    <%--//单个删除--%>
  /* $(document).on("click", ".delete_btn", function () {
        // 1.弹出是否确认删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del_id");
        if (confirm("确认删除【" + empName + "】吗？")) {
            //确认，发送ajax请求删除即可--%>
            $.ajax({
                url: "${pageContext.request.contextPath}/employee/deleteEmpById/" + empId,
                type: "DELETE",
                success: function (result) {
                    // alert(result.msg);
                    //回到本页--%>
                    if(result.code=200){
                        alert("删除成功")
                        to_page(Num_pageNum);
                    }else{
                        alert("删除失败")
                    }

                }
            });
        }
    });*/


    //完成全选/全不选功能
    $("#cb_id").click(function () {
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        //checked  点击上面的按钮跟下面的按钮对应
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    //check_item
    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#cb_id").prop("checked", flag);
    });
    //点击全部删除,批量删除
  $("#emp_delete_btn").click(function () {
        var empNames = "";
        var del_idstr="";
        $.each($(".check_item:checked"), function () {
            // this
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id的字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除empNames多余的逗号
        empNames = empNames.substring(0, empNames.length - 1);
        //去除del_idstr多余的 - 横线
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);

        if (confirm("确认删除【" + empNames + "】吗？")) {
            //发送ajax请求
          $.ajax({
               url:"${pageContext.request.contextPath}/employee/deleteEmpById/" + del_idstr,
                type:"DELETE",
                success:function (result) {
                    //回到本页--%>
                    if(result.code=200){
                        alert("删除成功")
                        $("#cb_id").prop("checked", false);
                        to_page(Num_pageNum);

                    }else{
                        alert("删除失败")
                    }
                }
            });
        }
    });
        var file = $("#file");
        // var errorInfo=null;
        // var files=null;
        // var errorInfo_wp=null;

</script>
</body>
</html>
