package dto;

import java.time.LocalDate;

public class Post {
	private int postId;
	private boolean isPublic;
	private String postTitle;
	private String postBody;
	private LocalDate writeDate;
	private int postIcon;
	
	public Post() {
		
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostBody() {
		return postBody;
	}

	public void setPostBody(String postBody) {
		this.postBody = postBody;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	public int getPostIcon() {
		return postIcon;
	}

	public void setPostIcon(int postIcon) {
		this.postIcon = postIcon;
	}
	
	
	
}
