package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private String boDate;
	private int boHit;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<BoardFileVO> boardFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				BoardFileVO boardFileVO = new BoardFileVO(item);
				boardFileList.add(boardFileVO);
			}
			this.boardFileList = boardFileList;
		}
	}
}

















