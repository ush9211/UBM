package ubmProgram.service;

public class Paging {
	
	/* 페이징을 위한 변수 */
	// 받아올 현재 페이지 번호
	private int currentPage;
	
	// 전체 글 수
	private int totalPosts;
	
	// 한 화면에 보일 페이지 수
	private int postsPerPage;
	
	// 한 화면에 보일 목록 수
	private int pagesPerBlock;
	
	
	public Paging(int currentPage, int totalPosts, int postsPerPage, int pagesPerBlock) {
		this.currentPage = currentPage;
		this.totalPosts = totalPosts;
		this.postsPerPage = postsPerPage;
		this.pagesPerBlock = pagesPerBlock;
	}
	
	// 전체 페이지 수
	public int getTotalPages() {
		return (int) Math.ceil((double)totalPosts/postsPerPage);
	}
	
	
	// 시작 페이지
	public int getStartPage() {
		return ((currentPage - 1)/pagesPerBlock) * pagesPerBlock + 1;
	}
	
	// 마지막 페이지
	public int getEndPage() {
		int endPage = getStartPage() + pagesPerBlock - 1;
		int totalPages = getTotalPages();

		return (endPage > totalPages) ? totalPages : endPage;
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", totalPosts=" + totalPosts + ", postsPerPage=" + postsPerPage
				+ ", pagesPerBlock=" + pagesPerBlock + ", getTotalPages()=" + getTotalPages() + ", getStartPage()="
				+ getStartPage() + ", getEndPage()=" + getEndPage() + "]";
	}
	
	
	
	
}
