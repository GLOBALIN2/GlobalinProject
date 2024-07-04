package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BookVO;
import org.zerock.mapper.BookMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
    private BookMapper bookMapper;
	
	@Transactional
	@Override
	public void booking(BookVO book) {
		try {
			if ( null == book.getBreakfast() ) {
				book.setBreakfast("x");
				bookMapper.insertBook(book);
			}
			bookMapper.insertBook(book);
		} catch (Exception e) {
			e.printStackTrace();
		}    
	}
//	@Transactional
//	@Override
//	public BookVO getBook(String mem_id) {
//		return bookMapper.getBook(mem_id);
//	}
	
	@Transactional
	@Override
	public List<BookVO> getBook(String mem_id) {
		return bookMapper.getBook(mem_id);
	}
	
	@Transactional
	@Override
	public void cancelBook(String mem_id) {
		 bookMapper.cancelBook(mem_id);
	}
	
}
