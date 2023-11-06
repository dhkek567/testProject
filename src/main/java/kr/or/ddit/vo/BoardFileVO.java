package kr.or.ddit.vo;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardFileVO {
	private MultipartFile item;
	private Integer boNo;
	private Integer fileNo;
	private String fileName;
	private Long fileSize;
	private String fileFancysize;
	private String fileMime;
	private String fileSavepath;
	private Integer fileDowncount;
	
	public BoardFileVO() {}
	public BoardFileVO(MultipartFile item) {
		this.item = item;
		this.fileName = item.getOriginalFilename();
		this.fileSize = item.getSize();
		this.fileMime = item.getContentType();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize); 
	}
}





