<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理员主页</title>
<script type="text/javascript" src="script/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        * {
        	margin: 0;
        	padding: 0;
        }
        
        #clock {
	position: relative;
	width: 300px;
	height: 300px;
	margin: 20px auto 0 auto;
	background: url(images/clockface.jpg);
	list-style: none;
	
        	}
        
        #sec, #min, #hour {
	position: absolute;
	width: 15px;
	height: 300px;
	top: -1px;
	left: 143px;
        	}
        	
        	#wz {
        	width: 15%;
    		margin: 0 auto;
     margin-right: auto; 
     margin-left: auto; 
    /* position: relative; */
        	}
        	#wz2 {
        	width: 7%;
    		margin: 0 auto;
     margin-right: auto; 
     margin-left: auto; 
    /* position: relative; */
        	}
        
        #sec {
        	background: url(images/sechand.png);
        	z-index: 3;
           	}
           
        #min {
        	background: url(images/minhand.png);
        	z-index: 2;
           	}
           
        #hour {
        	background: url(images/hourhand.png);
        	z-index: 1;
           	}
           	
        p {
            text-align: center; 
            padding: 10px 0 0 0;
            }
    </style>
    
    <script type="text/javascript">
    
        $(document).ready(function() {
         
              setInterval( function() {
              var seconds = new Date().getSeconds();
              var sdegree = seconds * 6;
              var srotate = "rotate(" + sdegree + "deg)";
              
              $("#sec").css({"-moz-transform" : srotate, "-webkit-transform" : srotate});
                  
              }, 1000 );
              
         
              setInterval( function() {
              var hours = new Date().getHours();
              var mins = new Date().getMinutes();
              var hdegree = hours * 30 + (mins / 2);
              var hrotate = "rotate(" + hdegree + "deg)";
              
              $("#hour").css({"-moz-transform" : hrotate, "-webkit-transform" : hrotate});
                  
              }, 1000 );
        
        
              setInterval( function() {
              var mins = new Date().getMinutes();
              var mdegree = mins * 6;
              var mrotate = "rotate(" + mdegree + "deg)";
              
              $("#min").css({"-moz-transform" : mrotate, "-webkit-transform" : mrotate});
                  
              }, 1000 );
         
        }); 
    
    </script>

</head>

<body>
	<br>
	<%
		//验证Lv
		String aid=null;
		if( (aid=request.getParameter("aid") ) == null)
		{
			aid=(String)session.getAttribute("aid");
		}
	
		
		String level=(String)session.getAttribute("level");
		
	%>
	<h2><center>管理员主页</center></h2>
	<h5>&nbsp;&nbsp;Welcome:<%=aid %> &nbsp;&nbsp; Your level:<%=level %> </h5><br>
	
	<!-- 日期 -->
	<div id="wz">今天是：<br>
	<script language=JavaScript>
	today=new Date();
	function initArray(){
	this.length=initArray.arguments.length
	for(var i=0;i<this.length;i++)
	this[i+1]=initArray.arguments[i] 
	}
	var d=new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	document.write(
	"<font color=#333 style='font-size:9pt;font-family: 宋体'> ",
	today.getFullYear(),"年",
	today.getMonth()+1,"月",
	today.getDate(),"日",
	d[today.getDay()+1],
	"</font>" 
	); 
	</script>
	</div>
	
	<!-- 时间 -->
	<td>
	<div id="clock" name="clock">	
	   	<div id="sec" name="sec"></div>
	   	<div id="hour"></div>
	  	<div id="min"></div>
	</div>
	<div id="wz2">
		<%
		int a=0;
		if(level!=null)
		{
			a=Integer.parseInt(level);
		}
		
		//管理页面
		if(a==1)	//管理宿舍表卫生字段
		{
			out.print("<a href='control_manage/con_m_health.jsp?aid="+aid+"'>宿舍卫生</a><br>");//宿舍表--评分
		}
		if(a==2)	//管理宿舍表水费、电费
		{
			out.print("<a href='control_manage/con_m_ele_wat.jsp?action=water'>水费</a><br>");//宿舍表--水费+电费
			out.print("<a href='control_manage/con_m_ele_wat.jsp?action=elector'>电费</a><br>");
		}
		if(a==3)	//报修表更新解决日期
		{
			out.print("<a href='control_manage/con_m_repair.jsp'>报修情况</a><br>");//报修表--解决日期
		}
		if(a==4)	//学生表更新入住时间、宿舍   更新退宿表	(住宿管理)
		{
			out.print("<a href=''>住宿管理</a><br>");//学生表+退宿表
		}
		if(a==5)	//学生、宿舍信息添加	(信息管理)
		{
			out.print("<a href='control_manage/con_m_info.jsp?action=student'>学生信息</a><br>");//学生表+宿舍表
			out.print("<a href='control_manage/con_m_info.jsp?action=dormitory'>宿舍信息</a><br>");
		}
		if(a==6)	//学生表 、宿舍表、报修表、退宿表、公告表 删除、更新
		{
			out.print("<a href=''>数据维护</a><br>");//Admin(Lv1-Lv6)
		}
		if(a==7)	//Admin Lv1-Lv6 公告表删除
		{
			out.print("<a href=''>人员指定</a><br>");//全表
		}
		if(a>=1)
		{
			out.print("<a href=''>查看公告</a><br>");
			out.print("<a href=''>填写公告</a><br>");
		}
		
		out.print("<a href='view_index.jsp'>退出</a><br>");
		%>
		
	</div>
	
	
	<style type="text/css" style="display: none !important;">
	* {
		margin: 0;
		padding: 0;
	}
	body {
		overflow-x: hidden;
	}
	.bsa_it_ad {
		padding: 8px 4px 8px 12px !important;
		position: relative;
		border: 0 !important;
		background: #D6D5D5 !important;
		border-top: 0 !important;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
		font: 11px "Lucida Grande", Sans-Serif !important;
	}
	.bsa_it_ad:before, .bsa_it_ad:after {
		content: "";
		position: absolute;
		top: 0;
		left: 6px;
		width: 100%;
		height: 100%;
		background: #989898;
		border-bottom: 6px solid #989898;
		z-index: -1;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.bsa_it_ad:before {
		top: 0;
		left: 12px;
		z-index: -2;
		background: #6C6666;
		border-bottom: 12px solid #6C6666;
	}

	.bsa_it_ad a {
	  margin: 0 !important;
		padding: 0 !important;
	}
	.bsa_it_ad a img {
	  border: 0 !important;
		position: static !important;
	}
	.bsa_it_ad a:hover img {
		margin: 0 !important;
	}
	.bsa_it_ad a:hover {
	  background: none !important;
	}
	.bsa_it_i {
		margin: 0 15px 0 0 !important;
	}
	.bsa_it_t {
		font-size: 14px !important;
		margin: 12px 0 0 0 !important;
	}
	.bsa_it_d {
		padding-right: 10px;
	}
	.bsa_it_p{
		display: none !important;
	}
	#demo-bar-ad {
		width: 416px;
		position: absolute;
		right: 0;
		top: -20px;
		font: 11px "Lucida Grande", Sans-Serif !important;
	}
	#bsap_aplink {
		position: absolute;
		color: #999;
		text-decoration: none;
		bottom: 8px !important;
		right: 8px !important;
		padding: 0 !important;
	}
	.bsa_it_p a:hover {
		background:none !important;
	}
	#demo-top-bar {
		text-align: left;
		background: #e18728;
		position: relative;
		zoom: 1;
		width: 100% !important;
		z-index: 6000;
		box-shadow: 0 0 10px black;
		padding: 20px 0 15px;
	}
	#demo-bar-inside {
		width: 960px;
		margin: 0 auto;
		position: relative;
	}
	#demo-top-bar:before, #demo-top-bar:after {
		content: "";
		position: absolute;
		top: 0;
		left: 6px;
		width: 100%;
		height: 100%;
		background: #e18728;
		border-bottom: 6px solid #8F5314;
		z-index: -1;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	}
	#demo-top-bar:before {
		top: 0;
		left: 12px;
		background: #6C6666;
		border-bottom: 12px solid #62390E;
	}

	#demo-bar-buttons {
		display: inline-block;
		width: 236px;
		text-align: center;
		vertical-align: top;
		font-size: 0;
	}
	#demo-bar-buttons a {
		font-size: 12px;
		color: white;
		display: block;
		margin: 2px 0;
		text-decoration: none;
		font: 14px "Lucida Grande", Sans-Serif !important;
	}
	#demo-bar-buttons a:hover,
	#demo-bar-buttons a:focus {
		color: #333;
	}

	#demo-bar-badge {
		display: inline-block;
		width: 302px;
		padding: 0 !important;
		margin: 0 !important;
		background-color: transparent !important;
	}
	#demo-bar-badge a {
		display: block;
		width: 100%;
		height: 38px;
		border-radius: 0;
		bottom: auto;
		margin: 0;
		background: url(/images/examples-logo.png) no-repeat;
		background-size: 100%;
		overflow: hidden;
		text-indent: -9999px;
	}
	#demo-bar-badge:before, #demo-bar-badge:after {
		display: none !important;
	}
	
     </style>
	
	</td>
	

</body>
	
</html> 