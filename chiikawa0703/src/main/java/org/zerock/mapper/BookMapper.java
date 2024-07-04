package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BookVO;

public interface BookMapper {
	
	public void insertBook(BookVO book);
	
//	public BookVO getBook(String mem_id);
	public List<BookVO> getBook(String mem_id);
	
	public void cancelBook(String mem_id);
}
