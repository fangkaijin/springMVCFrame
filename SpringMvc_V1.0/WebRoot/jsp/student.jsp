<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	request.setAttribute("path", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>学生列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script language="javascript"
	src="${path}/style/js/jQuery/jquery-1.8.0.min.js"></script>
<style>
<!--
table {
	border-collapse: collapse;
}

td {
	border: 1px solid #f00;
}
-->
</style>
<style mce_bogus="1">
table {
	border-collapse: collapse;
}

td {
	border: 1px solid #f00;
}
</style>
<script type="text/javascript">
<!--   
function add(){   
    window.location.href="${path}/student.do?method=add";   
}   
  
function del(id){   
$.ajax( {   
    type : "POST",   
    url : "${path}/student.do?method=del&id=" + id,   
    dataType: "json",   
    success : function(data) {   
        if(data.del == "true"){   
            alert("您确定删除么！");   
            $("#" + id).remove();   
        }   
        else{   
            alert("删除失败！");   
        }   
    },   
    error :function(){   
        alert("网络连接出错！");   
    }   
});   
}   
// --></script>
</head>
<body>

	<input id="add" type="button" onclick="add()" value="添加" />
	<table>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>密码</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list}" var="student">
			<tr id="<c:out value="${student.id}"/>">
				<td><c:out value="${student.id}" /></td>
				<td><c:out value="${student.name}" /></td>
				<td><c:out value="${student.psw}" /></td>
				<td><input type="button" value="编辑" /> <input type="button"
					onclick="del('<c:out value="${student.id}"/>')" value="删除" />
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>