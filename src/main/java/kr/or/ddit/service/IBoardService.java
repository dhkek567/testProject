package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardService {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO) throws Exception;
	public BoardVO selectBoard(int boNo);
	public BoardFileVO selectFileInfo(int fileNo);
	public ServiceResult deleteBoard(int boNo);
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO);

}
