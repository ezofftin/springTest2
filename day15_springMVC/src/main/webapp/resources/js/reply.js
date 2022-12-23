/**
 * javaDoc
 *
 * author : 김재현
 * 22.12.14 12:00
 */
 
 var replyFunc = (function(){
 	//댓글 등록 함수
 	function register(reply, cb){
 		$.ajax({
 			type: 'post',
 			url : '/bbs05/replies/new',
 			// 서버에 전송하는 데이터 형식
 			data : JSON.stringify(reply), // JSON객체 --> 문자열(텍스트)
 			contentType: "application/json; charset=utf8",
 			success:function(result){
 				if(cb){
 					cb(result);
 				}
 			},
 			error: function(){alert("요청실패!!");}
 		});
 	}
 	
 	// 댓글 삭제
 	function remove(rno, cb){
 		$.ajax({
 			// 전송방식 : delete
 			type:'delete',
 			url:'/bbs05/replies/'+rno,
 			success:function(delResult){
 				if(cb) cb(delResult);
 			},
 			error:function() {alert("요청실패!!")}
 		});
 	}
 	
 	// 특정 게시글에 대한 댓글 조회
 	// $.get() get방식으로 요청
 	// $.post() post방식으로 요청
 	function get(rno, cb){
 		// .json을 붙여서 json형태로 수신
 		$.get("/bbs05/replies/"+rno+".json", function(result){
 			if(cb) cb(result);
 		}).fail(function(){
 			alert("요청실패!!");
 		});
 	}
 	
 	// 특정 게시글의 댓글 리스트
 	function getList(param, cb){
 		var bid = param.bid;
 		
 		// $.ajax()이용할 경우에는 dataType을 'json' 설정
 		$.getJSON("/bbs05/replies/rList/"+bid+".json",
 			function(result){
 				if(cb) cb(result);
 			}).fail(function(){ alert("요청실패!!"); });
 	}
 	
 	// 댓글 수정
 	function update(reply, cb){
 		$.ajax({
 			type:'put',
 			url:'/bbs05/replies/'+reply.rno,
 			data: JSON.stringify(reply),
 			contentType: "application/json; charset=utf-8",
 			success: function(result){
 				if(cb) cb(result);
 			},
 			error:function() {alert("요청실패!!");}
 		});
 	} 
 	
 })();
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 