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
	<title>添加学生信息</title>
	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
			<meta http-equiv="expires" content="0">
				<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
					<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	
	function turnback(){   
    window.location.href="${path}/student.do";
	}
// -->
</script>
</head>
<body>
	<form method="post"
		action="${path}/student.do?method=save">
		<div>
			<c:out value="${addstate}"></c:out>
		</div>
		<table>
			<tr>
				<td>姓名</td>
				<td><input id="name" name="name" type="text" />
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="psw" name="psw" type="text" />
				</td>
			</tr>
			<tr>
				<td colSpan="2" align="center"><input type="submit" value="提交" />
					<input type="button" onclick="turnback()" value="返回" /></td>
			</tr>
		</table>
	</form>
</body>
</html>