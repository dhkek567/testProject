package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface BoardMapper {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);
	public int insertBoard(BoardVO boardVO);
	public void insertBoardFile(BoardFileVO boardFileVO);
	public BoardVO selectBoard(int boNo);
	public BoardFileVO selectFileInfo(int fileNo);
	public int deleteBoard(int boNo);
	public void deleteBoardFile(int boNo);
	public int updateBoard(BoardVO boardVO);
	public void deleteBoardFileList(Integer[] delBoardNo);

}
