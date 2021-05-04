<%@page import="com.simp.board.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="com.simp.product.model.vo.PaymentHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/my_page/my_header.jsp"%>
    

<%
	List<Review> reviewlist = (List<Review>)request.getAttribute("list");
%>
<style>
   .header_common {
      color : black;
      position : static;
      margin-left: 0;
      width: 1024px
   }
   
   .header_common a {
      color : black;
   }
   
   .scroll_menu {
      width: 1024px
   }
</style>

<!-- 리뷰 리스트 -->
<table class="review_tb">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col" class="al">글쓴이·날짜</th>
					<th scope="col" class="al"><a
						href="?st=code&sword=80219&od=goodcnt" class="fs_11 u">추천</a> <img
						src="https://ssl.pstatic.net/imgmovie/2007/img/common/bullet_arrow_bottom_1.gif"
						alt="" width="5" height="3"></th>
					<th scope="col"><a href="?st=code&sword=80219&od=readcnt"
						class="fs_11 u">조회</a> <img
						src="https://ssl.pstatic.net/imgmovie/2007/img/common/bullet_arrow_bottom_1.gif"
						alt="" width="5" height="3"></th>
				</tr>
			</thead>
			<tbody>
			<% if(list != null) { %>
			<% 	for(Review r : reviewlist) {
			%>
				<tr>
					<td class="title"><a href="<%= request.getContextPath() %>/review/board?no=<%= r.getReviewNo() %>"><%= r.getTitle() %></a></td>
					<td class="author num"><a href=""><%= r.getWriter() %></a> <br /> <%= r.getReviewDate() %></td>
					<td class="num c_ff4200"><img
						src="https://ssl.pstatic.net/imgmovie/2007/img/common/icon_recommend_1.gif"
						alt="" width="14" height="13"> <%= r.getRecomCnt() != 0 ? r.getRecomCnt() : "" %></td>
					<td class="num"><%= r.getReadCnt() != 0 ? r.getReadCnt() : "" %></td>
				</tr>
				<% 	} %>
				<% } else { %>
					<tr>
						<td colsapn=4>
							없음
						</td>
					</tr>
				<% 	} %>
			</tbody>
		</table>    
        
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<style>
.footer{
margin-top : 10vh;
  }
  
.mypage_wrap_2{
	height: auto;
	overflow:hidden;
}

.poster {
	text-align:center;
}

/* 리뷰 테이블 부분 */
.review_tb {
	padding: 0;
	border-top: 1px solid rgb(44, 44, 44);
	border-bottom: 1px solid rgb(44, 44, 44);
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

table.review_tb th, td {
	/* border-bottom: 1px solid gray; */
	padding: 0;
	margin: 0;
}

.review_tb td a {
	text-decoration: none;
	color: rgb(61, 61, 61);
}

.review_tb th {
	height: 35px;
	color: rgb(53, 52, 52);
	border-bottom: 1px solid rgb(202, 202, 202);
}

.review_tb td {
	border-bottom: 1px solid rgb(235, 235, 235);
}

.review_tb th a {
	color: rgb(80, 80, 80);
}

td.title {
	text-align: left;
	font-size: 14px;
}
</style>
</body>
<script>
$(".review_bar").addClass("active");
</script>
</html>        