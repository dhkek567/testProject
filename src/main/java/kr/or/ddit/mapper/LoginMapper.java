package kr.or.ddit.mapper;

import kr.or.ddit.vo.MemberVO;

public interface LoginMapper {

	public MemberVO idCheck(String memId);

	public MemberVO nickNameCheck(String nickname);

	public int signup(MemberVO memberVO);

	public MemberVO loginCheck(MemberVO memberVO);

}
