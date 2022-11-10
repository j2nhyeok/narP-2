package kr.bit.model;
// JDBC -> MyBatis, JPA

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	private static SqlSessionFactory sqlSessionFactory; // [ O O O O ] sqlsession을 저장할 factory
	
	// 초기화 블록-프로그램 실행 시 딱 한 번만 실행되는 코드 영역
	static {
		try {
			String resource = "kr/bit/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		} // 읽기 
	}
	
	// 회원 전체 리스트 보기
	public List<MemberVO> memberList() {
		// Connection+statement  => SqlSession
		SqlSession session=sqlSessionFactory.openSession();
		List<MemberVO> list=session.selectList("memberList"); // id 이름은 일반적으로 메서드 이름으로 한다.
		session.close(); // 반납
		return list;
	}
	
	// 회원가입
	public int memberInsert(MemberVO vo) {
		SqlSession session=sqlSessionFactory.openSession();
		int cnt=session.insert("memberInsert", vo);
		session.commit();
		session.close();
		return cnt;
	}
	
	// 회원삭제
	public int memberDelete(int num) {
		SqlSession session=sqlSessionFactory.openSession();
		int cnt=session.delete("memberDelete", num);
		session.commit();
		session.close();
		return cnt;
	}
	
	// 회원 상세보기
	public MemberVO memberContent(int num) {
		SqlSession session=sqlSessionFactory.openSession();
		MemberVO vo=session.selectOne("memberContent", num);
		session.close();
		return vo;
	}
	
	// 회원수정
	public int memberUpdate(MemberVO vo) {
		SqlSession session=sqlSessionFactory.openSession();
		int cnt=session.update("memberUpdate", vo);
		session.commit();
		session.close();
		return cnt;
	}
	
	// 회원 로그인
	public String memberLogin(MemberVO vo) {
		SqlSession session=sqlSessionFactory.openSession();
		String user_name=session.selectOne("memberLogin", vo);
		session.close();
		return user_name;
	}
}
