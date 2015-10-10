<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="jumbotron">
			<form class="form-inline">
			  <div class="form-group">
			    <label for="exampleInputName2">出发地</label>
			    <input type="text" class="form-control" id="from_city" placeholder="北京">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail2">目的地</label>
			    <input type="text" class="form-control" id="to_city" placeholder="上海">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail2">日期</label>
			    <input type="text" class="form-control" id="departing" placeholder="">
			  </div>
			  <button type="button" class="btn btn-default" id="search">查找</button> 
			
			</form>
			<hr>
			<ul class="list-group">			
			</ul>
		</div>
		<script>
			function render(data){
				var ul = $('.list-group');
				ul.html('');
				var html = '';
				if(data.length>0){
					$.each(data,function(index,ticket){
						html += '<li class="list-group-item"><span class="col-lg-2">'+ticket.departing.split(' ')[1].substring(0,5)+'-'
						+ticket.landing.split(' ')[1].substring(0,5)+'</span><span class="col-lg-3">'
						+ticket.costtime+'</span> <span class="col-lg-3">1站</span><span class="col-lg-3">剩余'
						+ticket.leftseats+'张 ￥'
						+ticket.price+'</span> <br /> <br /> <span class="col-lg-2">'
						+ticket.flight_name+'</span> <span class="col-lg-3">'
						+ticket.flight_no
						+'</span> <span class="col-lg-3"></span> <span class="col-lg-3"><a class="btn btn-warning" href="/airticketbooking/buyConfirm/'+ticket.id+'">'
						+'预订</a></span><br/> <br/>&nbsp;&nbsp;&nbsp;<a data-toggle="collapse" href="#demo'
						+ticket.id+'" aria-expanded="false">查看详情</a><div id="demo'
						+ticket.id+'"'+'" class="collapse">sssssss</div></li>';
						}
					);
					ul.html(html);
				}else{
					html +='<li class="list-group-item"><p class="bg-info">'+'没有查询结果'+"</p></li>";
					ul.html(html);
				}
			}
			function getDate(){
				var a = new Date();
				var b = a.getFullYear();
				var c = a.getMonth();
				(++c < 10)? c = "0" + c : c;
				var d = a.getDate();
				(d < 10)? d = "0" + d : d;
				var final = b + "-" + c + "-" + d; 
				return final;

			}
			$(function() {
				$('#departing').attr('placeholder',getDate());
			    $('#departing').datetimepicker({  
			        language:  'zh-CN',  
			        weekStart: 1,  
			        todayBtn:  1,  
			        autoclose: 1,  
			        todayHighlight: 1,  
			        startView: 2,  
			        minView: 2,  
			        forceParse: 0,
			        format:'yyyy-mm-dd'
			    });
			    $('#search').click(function(){
			    	var fromCity = $('#from_city').val();
			    	var toCity   = $('#to_city').val();
			    	if(fromCity==''){
			    		alert('请选择出发地！');
			    		return false;
			    	}
			    	if(toCity ==''){
			    		alert('请选择目的地！');
			    		return false;
			    	}
			    	if(toCity == fromCity){
			    		alert('出发地目的相同！');
			    		return false;
			    	}
			    	var departing = $('#departing').val();
			    	if(departing==''|| departing<getDate()){
			    		alert('请选择合适的日期');
			    		return false;
			    	}
			    	$.ajax({
			    		url : '/airticketbooking/tickets',// 跳转到 action    
						data : {from:fromCity,to:toCity,departing:departing},
						type : 'post',
						dataType : 'json',
						success : function(data) {
							render(data.list);
						}
			    	});
			    	
			    });
			    $('body').on('click','.btn-warning', function() {
			    	console.info($(this).attr('flight_id'));
			    });
			   
			})
		</script>
	</div>
	<%@ include file="footer.jsp"%>
