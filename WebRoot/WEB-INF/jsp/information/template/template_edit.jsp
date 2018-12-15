<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="template/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TEMPLATE_ID" id="TEMPLATE_ID" value="${pd.TEMPLATE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注1:</td>
								<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="255" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">模板名称:</td>
								<td><input type="text" name="TEMPLATE_NAME" id="TEMPLATE_NAME" value="${pd.TEMPLATE_NAME}" maxlength="255" placeholder="这里输入模板名称" title="模板名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">访问目录:</td>
								<td><input type="text" name="ACCESS_DIR" id="ACCESS_DIR" value="${pd.ACCESS_DIR}" maxlength="255" placeholder="这里输入访问目录" title="访问目录" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">优惠价格:</td>
								<td><input type="text" name="SELL_PRICE" id="SELL_PRICE" value="${pd.SELL_PRICE}" maxlength="10" placeholder="这里输入优惠价格" title="优惠价格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">行业类型:</td>
								<td><input type="text" name="INDUSTRY_TYPE" id="INDUSTRY_TYPE" value="${pd.INDUSTRY_TYPE}" maxlength="255" placeholder="这里输入行业类型" title="行业类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">原价:</td>
								<td><input type="text" name="ORIGINAL_PRICE" id="ORIGINAL_PRICE" value="${pd.ORIGINAL_PRICE}" maxlength="10" placeholder="这里输入原价" title="原价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">模板图片:</td>
								<td><input type="text" name="TEMPLATE_PICTURE" id="TEMPLATE_PICTURE" value="${pd.TEMPLATE_PICTURE}" maxlength="255" placeholder="这里输入模板图片" title="模板图片" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input class="span10 date-picker" name="MODIFY_TIEM" id="MODIFY_TIEM" value="${pd.MODIFY_TIEM}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">记录状态:</td>
								<td><input type="text" name="RECORD_STATUS" id="RECORD_STATUS" value="${pd.RECORD_STATUS}" maxlength="1" placeholder="这里输入记录状态" title="记录状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#TEMPLATE_NAME").val()==""){
				$("#TEMPLATE_NAME").tips({
					side:3,
		            msg:'请输入模板名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_NAME").focus();
			return false;
			}
			if($("#ACCESS_DIR").val()==""){
				$("#ACCESS_DIR").tips({
					side:3,
		            msg:'请输入访问目录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCESS_DIR").focus();
			return false;
			}
			if($("#SELL_PRICE").val()==""){
				$("#SELL_PRICE").tips({
					side:3,
		            msg:'请输入优惠价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELL_PRICE").focus();
			return false;
			}
			if($("#INDUSTRY_TYPE").val()==""){
				$("#INDUSTRY_TYPE").tips({
					side:3,
		            msg:'请输入行业类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INDUSTRY_TYPE").focus();
			return false;
			}
			if($("#ORIGINAL_PRICE").val()==""){
				$("#ORIGINAL_PRICE").tips({
					side:3,
		            msg:'请输入原价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORIGINAL_PRICE").focus();
			return false;
			}
			if($("#TEMPLATE_PICTURE").val()==""){
				$("#TEMPLATE_PICTURE").tips({
					side:3,
		            msg:'请输入模板图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEMPLATE_PICTURE").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			if($("#MODIFY_TIEM").val()==""){
				$("#MODIFY_TIEM").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODIFY_TIEM").focus();
			return false;
			}
			if($("#RECORD_STATUS").val()==""){
				$("#RECORD_STATUS").tips({
					side:3,
		            msg:'请输入记录状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECORD_STATUS").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>