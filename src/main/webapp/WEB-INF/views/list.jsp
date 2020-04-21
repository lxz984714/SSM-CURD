<%--
  Created by IntelliJ IDEA.
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" crossorigin="anonymous">
    <%--引入js--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <%--显示列表信息--%>
    <div class="container">
        <%--显示标题--%>
        <div class="col-md-12">
            <h1>SSM-员工</h1>
        </div>

        <div class="col-md-12">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary btn-lg glyphicon glyphicon-plus">添加</button>
            <button type="button" class="btn btn-warning btn-lg glyphicon glyphicon-trash"><strong>删除</strong></button>
        </div>

         <%--员工列表--%>
        <div class="col-md-12">
            <table class="table table-bordered">
                <tr>
                    <th>Id</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.empGender =='M'?'男':'女'}</td>
                        <td>${emp.empEmail}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button type="button" class="btn btn-success btn btn-primary btn-sm glyphicon glyphicon-pencil"> 编辑</button>
                            <button type="button" class="btn btn-danger btn btn-primary btn-sm c glyphicon glyphicon-trash"> 删除</button>
                        </td>
                    </tr>
                </c:forEach>
             </table>
        </div>
        <%--分页信息--%>
        <div class="col-md-12">
        <%--分页信息--%>
            <div class="col-md-6">
                当前在${pageInfo.pageNum}页,共${pageInfo.pages}页,共${pageInfo.total}条记录
            </div>

            <%-- 分页条--%>
                <div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=1">
                            <button type="button" class="btn btn-info btn btn-primary"> 首页</button>
                        </a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li class="active">
                                    <%--<上一页的按钮--%>
                                <a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                    <%--navigatepageNums循环页码号--%>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">              <%--执行成功--%>
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="disabled"><a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=${page_num}">${page_num}</a></li>
                            </c:if>
                            <%--执行不成功--%>
                            <c:if test="${page_num!= pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=${page_num}">${page_num}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/employee/getEmployeeList?pageNum=${pageInfo.pages}"> <button type="button" class="btn btn-warning btn btn-primary">末页</button></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
