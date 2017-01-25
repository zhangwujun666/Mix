<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>角色选项卡</title> 
<link rel="stylesheet" type="text/css" href="css/style.css" media="all" /> 
<script type="text/javascript" src="js/jquery-1.4.2.js"></script> 
<script type="text/javascript"> 
$(function(){ 
$('.tabPanel ul li').click(function(){ 
$(this).addClass('hit').siblings().removeClass('hit'); 
$('.panes>div:eq('+$(this).index()+')').show().siblings().hide(); 
}) 
}) 
</script> 
</head> 
<body> 
<div > 
<div class="tabPanel"> 
<ul> 
<li class="hit">企业方</li> 
<li>供应方</li> 
<li>京体网</li> 
</ul> 
	<div class="panes"> 
	<div class="pane" style="display:block;"> 
	
	<div align="center"> 
	<div id="Main"> 
	<div class="form_div1"><span class="span1">用户名：</span><input type="text" class="Textbox" /></div> 
	<div class="form_div1"><span class="span1">密　码：</span><input type="password" class="Textbox" /></div> 
	<div> 
	<div class="form_div1"><span class="span1"> </span> <input type="submit" name="btnLogin" value="登 录" class="Button" style="margin-top: 8px" /> <a href="#">忘记密码</a> </div> 
	
	</div> 
	<div style="line-height:32px;margin-top:10px;"> 
	<img src="images/li.png" /> <a href="#" >免费申请成为供应商</a> 
	
	<img src="images/li.png" /> <a href="#">免费申请成为企业方</a> 
	</div> 
	</div> 
	</div> 
	</div> 
<!--  -->
	<div class="pane"> 
	<h4>Secend tab content</h4> 
	<p>First tab content</p> 
	</div> 
<!--  -->
	<div class="pane"> 
	<h4>Third tab content</h4> 
	<p>First tab content</p> 
	</div> 
</div> 
</div> 
</div> 
</body> 
</html> 