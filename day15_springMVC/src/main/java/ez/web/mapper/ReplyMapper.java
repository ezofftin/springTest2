package ez.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ez.web.domain.ReplyDTO;

public interface ReplyMapper {
	// 추가
	public int insert(ReplyDTO rDto);
	
	// 조회
	public ReplyDTO select(int rno);
	
	// 수정
	public int update(ReplyDTO rDto); 
	
	// 삭제
	public int delete(int rno);
	
	// 특정 게시글에 대한 댓글 조회
	public List<ReplyDTO> getListByBid(@Param("bid") Integer bid);
}
