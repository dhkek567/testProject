package kr.or.ddit.controller.util;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.mapper.BoardMapper;
import kr.or.ddit.vo.BoardFileVO;

public class FileUploadUtils {
	
	
	public static void boardFileUpload(
			List<BoardFileVO> boardFileList, int boNo, HttpServletRequest req, BoardMapper mapper
			) throws Exception {
		String savePath = "/resources/board/";
		
		if(boardFileList != null && boardFileList.size() > 0) {
			for(BoardFileVO boardFileVO : boardFileList) {
				String saveName = UUID.randomUUID().toString();
				saveName = saveName +"_" +boardFileVO.getFileName().replace(" ", "_");
				
				String saveLocate = req.getServletContext().getRealPath(savePath + boNo);
				File file = new File(saveLocate);
				if(!file.exists()) {
					file.mkdirs();
				}
				
				saveLocate +="/"+saveName;
				boardFileVO.setBoNo(boNo);
				boardFileVO.setFileSavepath(saveLocate);
				mapper.insertBoardFile(boardFileVO);
				/////////////위에는 DB에 파일 데이터 넣기 
				
				File saveFile = new File(saveLocate);
				boardFileVO.getItem().transferTo(saveFile); // 실제 파일 복사
			}
		}
	}
}
