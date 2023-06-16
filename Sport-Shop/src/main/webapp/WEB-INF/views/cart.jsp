<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
document.getElementById("TenPage").innerHTML = "Cart";

	function tinhGiaTien(id)
	{
		var DG= document.getElementById("DG"+id).innerText.trim().replace("$","");
		var IP= document.getElementById("IP"+id).value.trim();
		console.log(DG);
		console.log(IP);
		document.getElementById("TG"+id).innerHTML= "<br>$"+Number(DG)*Number(IP);
		
		
		var gia= document.getElementsByClassName("tongGia");
		let tongGiaTri =0;  
		 for(let i=0;i<gia.length;i++)
		{
			let s=Number( gia[i].innerText.trim().replace("$",""));
			tongGiaTri+=s;
		}
		 document.getElementById("tongGiaOrder").innerHTML= "$"+tongGiaTri;
	}
	function deleteSP(e,id)
	{
		e.parentElement.parentElement.parentElement.parentElement.remove();
		var gia= document.getElementsByClassName("tongGia");
		let tongGiaTri =0;  
		 for(let i=0;i<gia.length;i++)
		{
			let s=Number( gia[i].innerText.trim().replace("$",""));
			tongGiaTri+=s;
		}
		 document.getElementById("tongGiaOrder").innerHTML= "$"+tongGiaTri;
	}
	function checkout()
	{
		var x= document.getElementsByClassName("soLuongCart");
		var tnCart=document.getElementById("inputSP");
		for(let i=0;i<x.length;i++)
		{
			tnCart.value+="&"+x[i].id.replace("IP","").trim()+"#"+x[i].value;
		}
		
		 document.getElementById('btCheckout').click();
	}
	
</script> 
<style>
input[type="search"] {
    border: 1px solid transparent;
    border-radius: 0;
    box-sizing: content-box;
    padding: 9px 10px 9px 26px;
    transition: all 0.5s ease 0s;
}
#demo-2 input[type="search"]:focus {
    background-color: #fff;
    color: black;
    cursor: auto;
    padding-left: 32px;
    width: 130px;
    border-color: none !important;
    border-radius: 25px;
    border: none;
}
</style>
<section class="padding-top100">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				
					<div class="cart-table table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center"></th>
									<th class="text-left">DESCRIPTION</th>
									<th class="text-left">MODEL NUMBER</th>
									<th class="text-left">QUANTITY</th>
									<th class="text-right">UNIT PRICE</th>
									<th class="text-right">TOTAL</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach var="p" items="${listCart}">
								<tr>
									<td class="text-left"><a ><img
											src="<c:url value='/resources/images/${p.hinhAnh}'/>" style="width: 100px"></a></td>
									<td class="text-left cart-product-title"><br>
									<a href="">${p.tenSP }</a>
										<hr></td>
									<td class="text-left"><br>${p.loaiSP }</td>
									<td class="text-left"><br>
									<div style="max-width: 200px;" class="input-group btn-block">
											<input onchange="tinhGiaTien('${p.maSP }')" id="IP${p.maSP}" type="number"  class="form-control soLuongCart" size="1" value="1" min="1">
											<span class="input-group-btn close-btn">
												<button style="margin-left: 1px" onclick="deleteSP(this,'${p.maSP}')" class="btn btn-primary"
													title="" type="button">
													<i class="fa fa-times-circle"></i>
												</button>
											</span>
										</div></td>
									<td id="DG${p.maSP }" class="text-right"><br>$${p.donGia }</td>
									<td id="TG${p.maSP }" class="text-right tongGia"><br>$${p.donGia }</td>
								</tr>
								</c:forEach>
							
							</tbody>
							
						</table>
					</div>
				
			</div>
		</div>
		<div class="row" >
			<div class="col-md-6 col-sm-6 col-xs-12" style="float: right;">
				<form action="cart/checkout.htm" method="post">
				<input id="inputSP" name="inputSP" value="" style="display: none;"/>
				<button style="display: none;" id="btCheckout"></button>
					<div class="cart-table table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" colspan="2">Cart Totals</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-left">
									<td><b>Order Total</b></td>
									<td id="tongGiaOrder" style="font-weight: 700">100</td>
								</tr>
								<tr class="text-left">
									<td><b>Shipping</b></td>
									<td>Shipping & taxes calculated at checkout</td>
								</tr>
							</tbody>
						</table>
						<div class="login-content">
							<div class="site-btn">
								<a href="product/index.htm" class="btn btn-1"> <span class="txt">Continue
										Shopping</span> <span class="round"><i
										class="fa fa-chevron-right"></i></span>
								</a>
							</div>
							<div class="site-btn">
								<a onclick="checkout()" class="btn btn-1"> <span class="txt">Checkout</span>
									<span class="round"><i class="fa fa-chevron-right"></i></span>
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

