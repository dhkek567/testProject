package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.service.ILoginService;
import kr.or.ddit.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService {
	
	@Inject
	private LoginMapper loginMapper;
	
	@Override
	public ServiceResult idCheck(String memId) {
		ServiceResult result = null;
		MemberVO memberVO = loginMapper.idCheck(memId);
		if(memberVO != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	@Override
	public ServiceResult nickNameCheck(String nickname) {
		ServiceResult result = null;
		MemberVO memberVO = loginMapper.nickNameCheck(nickname);
		if(memberVO != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	@Override
	public ServiceResult signup(MemberVO memberVO) {
		ServiceResult result = null;
		int status = loginMapper.signup(memberVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public MemberVO loginCheck(MemberVO memberVO) {
		return loginMapper.loginCheck(memberVO);
	}

	
}
