<%@page import="java.util.List"%>   
<%@page import="com.simp.movie.model.service.MovieService"%>
<%@page import="com.simp.movie.model.vo.ScreenMovie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/my_page/my_header.jsp"%>

<%
List<ScreenMovie> dip_List = (List<ScreenMovie>)request.getAttribute("dip_list");
%>

<div class="mypage_wrap_2" id="mypage_wrap" style="display : flex;">
<%
int n = 0;
if(dip_List != null) {
	for(ScreenMovie sm : dip_List) {
		n ++;
%>
	<div class="poster" style="border: 1px solid gold; width:33.3vw; margin: 10px auto;">
    	<div>
    		<a href="<%= request.getContextPath() %>/movie/movie_info?movie_title=<%= sm.getMovieTitle() %>">
	    		<img src="<%= request.getContextPath() %>/upload/movie/<%= sm.getMainPoster() %>" style="width:10vw;">
    		</a>
    	</div>
    	<p>
    		<strong class="tit" style="cursor: pointer;">
    			<%= sm.getMovieTitle() %>
    		</strong>
    	</p>
	</div>
	<% if(n == 3){ %>
<%  
			n=0;
		} 
	}
}
%>	
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
</style>
</body>
<script>
$(".dip_bar").addClass("active");
</script>
</html>