package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.util.FileUploadUtils;
import kr.or.ddit.mapper.BoardMapper;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class BoardServiceImpl implements IBoardService {
	
	@Inject
	private BoardMapper boardMapper;
	
	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardList(pagingVO);
	}

	@Override
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO) throws Exception {
		ServiceResult result = null;
		int status = boardMapper.insertBoard(boardVO);
		if(status > 0) {
			List<BoardFileVO> boardFileList = boardVO.getBoardFileList();
			FileUploadUtils.boardFileUpload(boardFileList, boardVO.getBoNo(), req, boardMapper);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public BoardVO selectBoard(int boNo) {
		
		return boardMapper.selectBoard(boNo);
	}

	@Override
	public BoardFileVO selectFileInfo(int fileNo) {
		return boardMapper.selectFileInfo(fileNo);
	}

	@Override
	public ServiceResult deleteBoard(int boNo) {
		ServiceResult result = null;
		boardMapper.deleteBoardFile(boNo);
		int status = boardMapper.deleteBoard(boNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO) {
		
		ServiceResult result = null;
		int status = boardMapper.updateBoard(boardVO);
		if(status > 0) {
			List<BoardFileVO> boardFileList = boardVO.getBoardFileList();
			try {
				
				FileUploadUtils.boardFileUpload(boardFileList, boardVO.getBoNo(), req, boardMapper);
				
				Integer[] delBoardNo = boardVO.getDelBoardNo();
				if(delBoardNo != null) {
					boardMapper.deleteBoardFileList(delBoardNo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
			
		}else {
			
			result = ServiceResult.FAILED;
		}
		return result;
	}

}











