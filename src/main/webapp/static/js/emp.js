$(document).on("click", ".delete_btn", function () {
    // 1.弹出是否确认删除对话框
    var empName = $(this).parents("tr").find("td:eq(2)").text();
    var empId = $(this).attr("del_id");
    if (confirm("确认删除【" + empName + "】吗？")) {
        //确认，发送ajax请求删除即可--%>
        $.ajax({
            url: "/employee/deleteEmpById/" + empId,
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
});


