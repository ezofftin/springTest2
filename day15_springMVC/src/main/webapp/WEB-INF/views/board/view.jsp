<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                         
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">       
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'></script>         
</head>
<body>
<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<h3>글상세보기</h3>
		<div class="form-group">
			<label for="subject">번호</label>
			<input type="text" class="form-control" id="bid" 
				name="bid" disabled value="${board.bid}"/>
		</div>

		<div class="form-group">
			<label for="subject">제목</label>
			<input type="text" class="form-control" id="subject" 
				name="subject" disabled value="${board.subject}"/>
		</div>

		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" id="contents" 
				name="contents" rows="4" disabled>${board.contents}</textarea>
		</div>
		<div class="form-group">
			<label for="writer">글쓴이</label>
			<input type="text" class="form-control" id="writer" 
				name="writer" disabled value="${board.writer}"/>
		</div>
		<div class="form-group mt-4">
			<button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
			<button type="button" id="btn-list" class="btn btn-primary">리스트</button>
		</div>
		
		<!---------------------- 댓글 UI ------------------------->
		<!-- 댓글 버튼 -->
		<div class="mt-4 d-flex justify-content-between">
			<h6><i class="fa fa-comments-o"></i> 댓글</h6>
			<button class="btn btn-sm btn-outline-secondary"
			data-bs-toggle="modal" data-bs-target="#replyModal">새댓글</button>
		</div>
		
		<!-- 댓글 리스트 영역 -->
		<ul class="m-0 p-0 mt-4 replyArea" style="list-style:none">
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-12-14 15:50</span>
					</div>
					<p>댓글 테스트 입니다... ...</p>
				</div>
			</li>
			<li class="">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-12-14 15:50</span>
					</div>
					<p>댓글 테스트 입니다... ...</p>
				</div>
			</li>
		</ul><!-- 댓글 리스트 END-->
		
	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header border-0">
      	<h5 class="modal-title">댓글 달기</h5>
        <button type="button" class="btn-close" 
        	data-bs-dismiss="modal" onclick="clearValue()"></button>
      </div>

      <!-- Modal body -->
      <form>
	      <div class="modal-body p-4">
	      	<div class="mb-3">
		      	<label for="reply_contents" class="">댓글 내용</label>
		      	<textarea class="form-control" id="reply_contents"></textarea>
	      	</div> 
	      	<div class="mb-3">
		      	<label for="replyer" class="">댓글 작성자</label>
				<input type="text" class="form-control" id="replyer" name="replyer"/>
	      	</div> 
	      	<div class="mb-3">
		      	<label for="reply_date" class="">등록일</label>
				<input type="text" class="form-control" id="reply_date" name="reply_date"/>
	      	</div>
	      </div>
	      
	      
	      <!-- Modal footer -->
	      <div class="modal-footer border-0">
	        <button type="button" id="btn-md-modify" class="btn btn-sm btn-primary">수정</button>
	        <button type="button" id="btn-md-remove" class="btn btn-sm btn-danger">삭제</button>
	        <button type="button" id="btn-md-register" class="btn btn-sm btn-primary">등록</button>
	        <button type="button" id="btn-md-close" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	  </form> 	

    </div>
  </div>
</div>


<script src="/bbs06/resources/js/reply.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var bidVal = '<c:out value="${board.bid}"/>';
		
		// 등록 테스트
/*  		replyFunc.register(
			{bid:bidVal, r_contents:"댓글 테스트입니다...", replyer:"고길동"},
			function(result){
				alert("result : "+result);
			}
		);  */
		
		// 삭제 테스트
/* 		replyFunc.remove(11, function(result){
			console.log(result);
			
			if(result === "success") alert("삭제 성공!!");
		}); */
		
		// 댓글 조회 테스트
/* 		replyFunc.get(5, function(data){
			console.log(data);
		}); */
		
		// 댓글 리스트 가져오기 테스트
/*  		replyFunc.getList({bid:bidVal}, function(list){
			for(var i = 0; i < list.length; i++){
				console.log(list[i]);
			}
		}); */
		
		// 댓글 수정 테스트
/* 		replyFunc.update(
			{rno:8, r_contents:"수정 수정 수정... ..."},
			function(result){
				alert("수정 완료!!");
			}
		); */
		
		// 즉시실행함수 테스트
/* 		var replyFunc = (function(){
			
			function register(reply){
				console.log(reply + ".....");
			}
			
			// cb는 콜백함수
			function register2(reply, cb){
				console.log(reply + ".....");
				cb();
			}
			
			return {
				register : register,
				register2 : register2
			};
		})();
		
		console.log(replyFunc.register("하이"));
		
		console.log(replyFunc.register2("하이", function(){console.log("콜백함수~~~")} )
		); */
		
		// 댓글 리스트
		var replyArea = $(".replyArea");
		
		displayList();
		
		function displayList(){
			replyFunc.getList({bid:bidVal}, function(list){
				var str="";

				// 댓글이 없을 경우에 댓글 영역에는 아무것도 출력되지 않도록 처리
				if(list == null || list.length == 0){
					replyArea.html("");
					return;
				}
				
				// 댓글이 있는 경우
				for(var i = 0; i < list.length; i++){
					
					str +='<li class="mb-2 p-0"><div class="form-control">'
							+'<div class="d-flex justify-content-between">'
							+'<h6><b>'+list[i].replyer+'</b></h6><span>'+ replyFunc.showDateTime(list[i].r_date) +'</span></div>'
							+'<p>'+list[i].r_contents+'</p></div></li>';	
				}				
				replyArea.html(str);
			});
		}
		
		$("#btn-list").click(() => {
			location.href="<c:url value='/list.do?viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
		})
		
		$("#btn-modify").click(() => {
			location.href="<c:url value='/modify.do?bid=${board.bid}&viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
		})
	});
</script>

</body>
</html>