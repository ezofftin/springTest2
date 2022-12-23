package ez.web.service;

import java.util.List;

import ez.web.domain.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO rDto);
	
	public ReplyDTO read(int rno);
	
	public int modify(ReplyDTO rDto);
	
	public int remove(int rno);
	
	public List<ReplyDTO> getList(Integer bid);
}
