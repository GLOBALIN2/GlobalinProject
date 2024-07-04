package org.zerock.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.BookVO;
import org.zerock.domain.User;
import org.zerock.service.BookService;
import org.zerock.service.EmailService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor    
public class BookController {
	 	@Autowired
	    private BookService bookService; 
	 	@Autowired
	 	private UserService userService;
	 	@Autowired
	    private EmailService emailService;
	    
	 	// 로그인 후 예약 버튼 눌렀을 때
	    @GetMapping("/book") 
	    public String goBooking() {
	        return "book";
	    }
	    
	    // 체크해서 고르고 예약하기 버튼 눌렀을 때
	    @GetMapping("/goBook")
	    public String showBooking(HttpServletRequest request, Model model) {
	    	log.info(this);
	    	
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	
	    	if (mem_id == null) {
	            // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	            return "loginForm";
	        }
		            
	    	 User user = userService.getUserInfo(mem_id);
		            
	    	 model.addAttribute("user", user);	
		            
		            String branch = request.getParameter("branch");
		            String checkin = request.getParameter("from");
		            String checkout = request.getParameter("to");
		            String person = request.getParameter("person");
		            String roomtype = request.getParameter("roomtype");
		            //String roomName = request.getParameter("roomName");
		            String charge = request.getParameter("charge");

		            model.addAttribute("branch", branch);
		            model.addAttribute("checkin", checkin);
		            model.addAttribute("checkout", checkout);
		            model.addAttribute("person", person);
		            model.addAttribute("roomtype", roomtype);
		            //model.addAttribute("roomName", roomName);
		            model.addAttribute("charge", charge);
	        // 모델에 데이터를 추가하고 book_detail 페이지로 이동
	        return "book_detail";
	    }	    	   
	    
	    // 예약 완료 하기, db저장
	    @PostMapping("/checkBook") 
	    public String booking(HttpServletRequest request, BookVO book, User user, Model model)throws MessagingException  {
	    	HttpSession session = request.getSession();	  
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	 // 세션에서 가져온 mem_id를 BookVO 객체에 설정
	        book.setMem_id(mem_id);
	        String book_no = RandomStringUtils.randomAlphanumeric(10);
	        book.setBook_no(book_no);
	    			bookService.booking(book);
	    		
	    			user = userService.getUserInfo(mem_id);
//	   		    book = bookService.getBook(mem_id);	
//	   		    model.addAttribute("user", user);	
//	   		    model.addAttribute("book", book);
//	   		    
//	   		 // 이메일 전송
//	   	      emailService.sendBookingEmail(user.getMem_email(), (BookVO) book);
//	   	        
	   	         return "afterLogin";
	    }
	    
	    // 마이페이지에서 예약 조회 하기
	    @GetMapping("/bookCheck")
	    public String bookCheck(HttpServletRequest request, User user, Model model, BookVO book) {
	    	HttpSession session = request.getSession();
	    	 
	    	String mem_id = (String) session.getAttribute("mem_id");
		            
	    	 user = userService.getUserInfo(mem_id);
	    	 
		     //book = bookService.getBook(mem_id);
	    	 
	    	 model.addAttribute("bookList", bookService.getBook(mem_id));
	    	 
	    	 
	  //  	 model.addAttribute("book", book);
		            
	    	return "BookCheck";
	    }
	    
	    // 예약 조회 하기 
	   /* @GetMapping("/bookCheck")
	    public String booked(HttpServletRequest request, Model model) {
	    	HttpSession session = request.getSession();
	    	 String mem_id = (String) session.getAttribute("mem_id");
	    	 	// 세션에 저장된 id로 회원 정보 가져옴
		            User user = userService.getUserInfo(mem_id);
		            model.addAttribute("user", user);
		        // 세션에 저장된 id로 예약 정보 가져옴    
		            BookVO book = bookService.getBookInfo(mem_id);
		            model.addAttribute("book", book);
	    	return "BookCheck";
	    }*/
	    
	    // 예약 취소 하기
	    @PostMapping("/cancelBook") 
	    public String cancelBook(HttpServletRequest request, BookVO book) {
	    	HttpSession session = request.getSession();	  
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	 // 세션에서 가져온 mem_id를 BookVO 객체에 설정	       
	    	book.setMem_id(mem_id);
	    	bookService.cancelBook(mem_id);
	    	return "bookCancel";
	    }
}
