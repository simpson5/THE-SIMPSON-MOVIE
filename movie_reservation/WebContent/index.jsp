<%@page import="com.simp.movie.model.vo.Banner"%>
<%@page import="com.simp.movie.model.service.MovieService"%>
<%@page import="com.simp.movie.model.vo.ScreenMovie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%

List<ScreenMovie> topList = new MovieService().topList();

%>
<!-- 뭐가 문제일까 -->
<c:set var="bannerPoster" value="<%= new MovieService().bannerList() %>" />
<c:if test="${ loginMember != null }">
<c:set var="recoList" 
	   value="<%= new MovieService().recoList(loginMember.getMember_id(), loginMember.getPreference_genre()) %>" />
</c:if>
<style>
.title-menu {
  right: 5px;
  top: 15px;
}
</style>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
    <!-- 배너 포스터 -->
    <div class="screen-poster-container">
      <i class="fas fa-angle-left poster-icon"></i>
      <c:forEach items="${ bannerPoster }" var="bp" varStatus="vs">
      <img
        class="screen-poster"
        id="screen-poster${ vs.index }"
        src="${ bp.poster }"
        alt=""
      />
      </c:forEach>
      <i class="fas fa-angle-right poster-icon"></i>
    </div>
    <!-- 배너 포스터 -->
    
	<!-- 상영 영화 리스트 -->
<div class="current-screen">
<p style="color:white; margin: 0px; text-align:left; padding-left: 10vw; margin-bottom:-10vh;">인기영화</p>

<%
if(topList != null) {
	for(ScreenMovie si : topList) {
%>
		<div class="current-screen-poster">
			<img src="<%= request.getContextPath() %>/upload/movie/<%= si.getMainPoster() %>" alt="<%= si.getMainPoster() %>"/>
			<table class="screen_info_box">
				<tr class="title-parent">
					<td colspan=2 >
						<span class="screen_info movie-title"><%= si.getMovieTitle() %></span>
					</td>
				</tr>
				<tr class="title-parent-next">
					<td style="margin: 0 3px;">
						<span class="screen_info rate"><%= si.getPurchaseRate() * 100 %> %</span>
					</td>
					<td style="margin: 0 3px;">
						<span class="screen_info heart">
					<% if((dipList != null) && dipList.contains(si.getMovieTitle())) { %>
							<i class="dip_movie fas fa-heart"></i>
					<% } else { %>
							<i class="dip_movie far fa-heart"></i>
					<% } %>					
						</span>
					</td>
				</tr>
			</table>
			<div class="screen_bg">
				<form action="<%= request.getContextPath()%>/movie/reservation">
					<input type="hidden" name="movie_title" value="<%= si.getMovieTitle() %>"/>
					<input class="img-btn1" type="submit" value="예매하기" />
				</form>
				<form action="<%= request.getContextPath()%>/movie/movie_info">
					<input type="hidden" name="movie_title" value="<%= si.getMovieTitle() %>"/>
	            	<input class="img-btn2" type="submit" value="상세정보" />
				</form>
			</div>
		</div>
<%
	}
}
%>
<br />
<p style="color:white; margin: 0px; text-align:left; padding-left: 10vw; margin-bottom:-10vh;">추천영화</p>
<br />
<c:forEach items="${ recoList }" var="reco">
		<div class="current-screen-poster">
			<img src="<%= request.getContextPath() %>/upload/movie/${ reco.mainPoster }" alt="${ reco.mainPoster }"/>
			<table class="screen_info_box">
				<tr class="title-parent">
					<td colspan=2 >
						<span class="screen_info movie-title">${ reco.movieTitle }</span>
					</td>
				</tr>
				<tr class="title-parent-next">
					<td style="margin: 0 3px;">
						<span class="screen_info rate">${ reco.purchaseRate } %</span>
					</td>
 					<td style="margin: 0 3px;">
						<span class="screen_info heart">
					<c:if test="${ dipList.contains(reco.movieTitle) }">
							<i class="dip_movie fas fa-heart"></i>
					</c:if>
					<c:if test="${ !dipList.contains(reco.movieTitle) }">
							<i class="dip_movie far fa-heart"></i>				
					</c:if>
						</span>
					</td>
				</tr>
			</table>
			<div class="screen_bg">
				<form action="<%= request.getContextPath()%>/movie/reservation">
					<input type="hidden" name="movie_title" value="${ reco.movieTitle }"/>
					<input class="img-btn1" type="submit" value="예매하기" />
				</form>
				<form action="<%= request.getContextPath()%>/movie/movie_info">
					<input type="hidden" name="movie_title" value="${ reco.movieTitle }"/>
	            	<input class="img-btn2" type="submit" value="상세정보" />
				</form>
			</div>
		</div>
</c:forEach>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script src="js/index.js"></script>
<script>
$(".dip_movie").click(function(){	
<% if(loginMember != null) { %>
	var movie_title = $(this).closest(".title-parent-next").prev().find(".movie-title").html();
	console.log(movie_title);
	if($(this).hasClass("far")){
		$(this).removeClass("far").addClass("fas");
	} else {
		$(this).removeClass("fas").addClass("far");
	}
	if($(this).hasClass("fas")){
		$.ajax({
			url: "<%= request.getContextPath() %>/movie/dip",
			data: {
				memberId: "<%= loginMember.getMember_id() %>",
				movieTitle: movie_title
			},
			success: function(data){
				if(data > 0) {
					swal("찜", "성공", "success");				
				}
				else {
					swal("찜", "실패", "error");
				}
			},
			error: function(xhr, status, err){
				console.log(xhr, status, err);
			}
		});
	} else {
		$.ajax({
			url: "<%= request.getContextPath() %>/movie/dip",
			method: "POST",
			data: {
				memberId: "<%= loginMember.getMember_id() %>",
				movieTitle: movie_title
			},
			success: function(data){
				if(data > 0) {
					swal("찜 삭제", "성공", "success");				
				}
				else {
					swal("찜 삭제", "실패", "error");
				}
			},
			error: function(xhr, status, err){
				console.log(xhr, status, err);
			}
		});
	}
<% } else { %>
	swal("찜", "로그인 후 영화 찜하기가 가능합니다.", "error")
<% } %>
})
</script>
</html>