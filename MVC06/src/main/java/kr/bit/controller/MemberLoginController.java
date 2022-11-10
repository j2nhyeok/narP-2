package kr.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String ctx=request.getContextPath();
			String user_id=request.getParameter("user_id");
			String password=request.getParameter("password");
			
			MemberVO vo=new MemberVO();
			vo.setId(user_id);
			vo.setPass(password);
			
			MemberDAO dao=new MemberDAO();
			String user_name=dao.memberLogin(vo); 
			// user_name에 값이 있으면 인증에 성공, 없으면 인증에 실패
			if(user_name!=null && !"".equals(user_name)) {
				//성공
				request.getSession().setAttribute("userId", user_id);
				request.getSession().setAttribute("userName", user_name);
			}else {
				//실패
				request.getSession().setAttribute("userId", "");
				request.getSession().setAttribute("userName", "");
				request.getSession().setAttribute("msg", "사용자 정보가 올바르지 않습니다.");
			}
		return "redirect:"+ctx+"/memberList.do";
				
	}

}
