package ez.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.web.domain.ReplyDTO;
import ez.web.mapper.ReplyMapper;

@Service
public class ReplyServieImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO rDto) {
		
		return mapper.insert(rDto);
	}

	@Override
	public ReplyDTO read(int ron) {
		return mapper.select(ron);
	}

	@Override
	public int modify(ReplyDTO rDto) {
		return mapper.update(rDto);
	}

	@Override
	public int remove(int rno) {
		return mapper.delete(rno);
	}
	
	@Override
	public List<ReplyDTO> getList(Integer bid) {
		
		return mapper.getListByBid(bid);
	}
	
}
