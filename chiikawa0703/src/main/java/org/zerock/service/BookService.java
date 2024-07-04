package org.zerock.service;

import java.util.List;

import org.zerock.domain.BookVO;

public interface BookService {
	
	public void booking(BookVO book);
	
//	public BookVO getBook(String mem_id);
	
	public List<BookVO> getBook(String mem_id);
	
	public void cancelBook(String mem_id);
}