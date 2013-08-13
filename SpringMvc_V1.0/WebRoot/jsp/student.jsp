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
<script type="text/javascript"
	src="${path}/style/js/jQuery/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="${path}/style/js/jQuery/w2UI/w2ui-1.2.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${path }/style/Flat-UI-2.0/css/flat-ui.css" />
<link type="text/css" rel="stylesheet"
	href="${path }/style/css/W2UI/w2ui-1.2.min.css" />


<script type="text/javascript">
<!--
	function add() {
		window.location.href = "${path}/student.do?method=add";
	}

	function del(id) {
		$.ajax({
			type : "POST",
			url : "${path}/student.do?method=del&id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.del == "true") {
					alert("您确定删除么！");
					$("#" + id).remove();
				} else {
					alert("删除失败！");
				}
			},
			error : function() {
				alert("网络连接出错！");
			}
		});
	}
// -->
</script>

<script type="text/javascript">
$('#grid').w2grid({ 
	name: 'grid', 
	url: '/data/list.json',
	columns: [				
		{ field: 'fname', caption: 'First Name', size: '30%' },
		{ field: 'lname', caption: 'Last Name', size: '30%' },
		{ field: 'email', caption: 'Email', size: '40%' },
		{ field: 'sdate', caption: 'Start Date', size: '120px' }
	]
});
</script>
</head>
<body>

	<div id="grid" style="width: 100%; height: 500px;"></div>
</body>
</html>