<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dao.*,
				ubmProgram.dto.*,
				ubmProgram.service.*,
				java.sql.Connection,
				java.util.ArrayList,
				java.sql.Timestamp,
                java.text.SimpleDateFormat,
                java.text.NumberFormat "  %>
<%@ page import="ubmProgram.dto.*, ubmProgram.dao.*, java.sql.Connection, java.util.ArrayList "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />

<%  

		//세션 객체를 얻음
		HttpSession sess = request.getSession(true);
		
		String sname = request.getParameter("searchname");
		String svalue = request.getParameter("searchvalue");
		
		ServletContext cont = getServletContext();
                
        Connection conn = db.conn;
        ClassDao dao = new  ClassDao(conn);  
      

     	// 현재 페이지
     	int pg;
     	
     	// 1. 전체 게시글 수
     	int cnt;
     	
     	// 2. 한 페이지에 보일 목록 수
     	int listCount = 10;
     	
     	// 3. 한 페이지에 보일 페이지 수
     	int pageCount = 5;
     	
     	// 4. 쿼리문으로 보낼 시작 페이지번호
     	int limitPage;
     	
     	String cpg = "1";
     	cpg = request.getParameter("cpg");
     	
     	if(cpg == null){
     		pg = 1;
     	}else{
     		pg = Integer.parseInt(cpg);
     	}

          
          
   
     
     	// (현재 페이지-1) x 목록 수
    	limitPage = (pg-1)*listCount;
     	
     	
    	DbWorks dbs = new DbWorks(limitPage, listCount, sname, svalue);
    	
    	// 전체 게시글 수 가져오기
    	cnt = dao.AllSelectDB(); 
    	
    	// Paging 클래스 호출 (현재 페이지, 전체글 수, 페이지 갯수, 글 목록 수)
    	Paging myPage = new Paging(pg, cnt, listCount, pageCount);	
    	
    	

    	// 검색
    	ArrayList<CDto> list = null;
    	
    	if(sname == null || sname.trim().isEmpty()){
    		list = dbs.getList();
    	}else{
    		list = dbs.getSearchList();
    	}

    	
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    	NumberFormat formatter = NumberFormat.getInstance();
%>
   

     <section>
			<div class="listbox">

                   <div class="tabsbox">
                      <ul class="tabnav">
                          <li class="active"><a href="#open">개설과목</a></li>
                          <li><a href="#wish">희망과목</a></li>
                      </ul>
                      <div class="line-box"></div>
                      
                      <div class="tabbox regist">
                         <div class="tab active" id="open">
                         
                            <form name="searchform" id="searchform" class="searchform" method="get">
		                        <div class="search2 input-group mb-3 col-12">
		                           <p class="col-2">키워드 검색</p>
		                           <div class="dropdown col-4 keyword">
		                              <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
		                              		학과명
		                              </button>
		                              <input type="hidden" name="searchname" id="searchname" value="d_name">
		                              <div class="dropdown-menu">
		                                 <a class="dropdown-item" href="d_name">학과명</a>
		                                 <a class="dropdown-item" href="c_name">수업명</a>
		                                 <a class="dropdown-item" href="p_name">교수명</a>
		                              </div>
		                           </div>
		                           <input type="search" name="searchvalue" class="form-control" placeholder="검색">
		                           <div class="input-group-append">
		                               <button type="submit" class="btn btn-primary col-2"><i class="ri-search-line"></i>&nbsp;조회</button>
		                           </div>
		                        </div>
		                     </form>
		                     
                     		<div class="list-inbox">
                                <div class="d-flex justify-content-between py-4">
                                    <div>
                                        <h3>개설과목 목록</h3>
                                    </div>
                                </div>
            
                                <table class="table table-hover">
                                    <colgroup>
                                        <col width="5%">
                                        <col width="7%">
                                        <col width="5%">
                                        <col width="7%">
                                        <col width="25%">
                                        <col>
                                        <col>
                                        <col>
                                        <col width="7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>학과</th>
                                            <th>학점</th>
                                            <th>희망</th>
                                            <th>교과목</th>
                                            <th>담당교수</th>
                                            <th>강의시간</th>
                                            <th>강의실</th>
                                            <th>잔여석</th>
                                        </tr>  
                                    </thead>
                                    <tbody>
                                        <!-- loop -->
            							<!-- loop -->
            							<%
			                            	// 게시글 번호
			                            	int num = cnt - limitPage;
			                            
			                            	for(int i=0; i<list.size(); i++){
			                            		CDto dto = list.get(i);
			                            		int c_id = dto.getC_id();
			                            		String d_name = dto.getD_name();
			                            		int grade = dto.getGrade();
			                            		String c_name = dto.getC_name();
			                            		String p_name = dto.getP_name();
			                            		String when = dto.getWhen();
			                            		String where = dto.getWhere();
			                            		int max = dto.getMax();
			                            		int p_id = dto.getP_id();
			                            		int d_id = dto.getD_id();
			                            %>
			                            <tr>
			                                <td class="text-center"><%=num %></td>
			                                <td class="text-center"><%=d_name %></td>
			                                <td class="text-center"><%=grade %></td>
			                                <td class="text-center">
			                                	<a href="#" class="hempty"><i class="ri-heart-add-2-line"></i></a>
		                                	</td>
			                              <% if(sess.getAttribute("mid") != null) {%>
			                                <td>
			                                	<a href="contents.jsp?id=<%=c_id%>&cpg=<%=pg %>"><%=c_name %></a>
			                                    <span></span>
			                                    <!--  
			                                    <i class="ri-file-image-fill"></i>
			                                    <i class="ri-file-pdf-2-fill"></i>
			                                    <i class="ri-file-hwp-fill"></i>
			                                    -->
			                                </td>
			                              <% }else{ %>
			                               	<td>
			                               		<!-- javascript:void(0) : 자바스크립트 실행금지 -->
			                               		<a href="javascript:void(0)"><%=c_name %></a>
			                                    <span></span>
			                                    <!--  
			                                    <i class="ri-file-image-fill"></i>
			                                    <i class="ri-file-pdf-2-fill"></i>
			                                    <i class="ri-file-hwp-fill"></i>
			                                    -->
			                                </td>
			                              <% } %>
			                                <td class="text-center"><%=p_name %></td>
			                                <td class="text-center"><%=when %></td>
			                                <td class="text-center"><%=where %></td>
			                                <td class="text-center"><%=max %></td>
			                            </tr>
			                            <%
			                                num--;
			                            	}
			                            %>
                                        <!-- /loop -->
                                    </tbody>
                                </table>
                         	</div>
                         </div>
                         <div class="tab" id="wish">
                            <div class="list-inbox">
                                <div class="d-flex justify-content-between py-4">
                                    <div>
                                        <h3>희망과목 목록</h3>
                                    </div>
                                </div>
            
                                <table class="table table-hover">
                                    <colgroup>
                                        <col width="5%">
                                        <col width="7%">
                                        <col width="5%">
                                        <col width="7%">
                                        <col width="25%">
                                        <col>
                                        <col>
                                        <col>
                                        <col width="7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>학과</th>
                                            <th>학점</th>
                                            <th>신청</th>
                                            <th>교과목</th>
                                            <th>담당교수</th>
                                            <th>강의시간</th>
                                            <th>강의실</th>
                                            <th>잔여석</th>
                                        </tr>  
                                    </thead>
                                    <tbody>

                                        <!-- loop --> 
            								<tr>
            									<td class="text-center">1</td>
				                                <td class="text-center"><a href="#">삭제</a></td>
				                                <td class="text-center">학점</td>
				                                <td class="text-center"><a href="#">신청</a></td>
				                                <td class="text-center">교과목</td>
				                                <td class="text-center">담당교수</td>
				                                <td class="text-center">강의시간</td>
				                                <td class="text-center">강의실</td>
				                                <td class="text-center">잔여석</td>
				                            </tr>

                                        <!-- /loop -->
                                    </tbody>
                                </table>
                                
                                
                             </div> <!-- /.list-inbox -->
                           
                        </div> <!-- /#wish -->
                      
                   
                </div> <!-- /.tabbox -->          
  
			<div class="d-flex justify-content-between py-4">
			                        <div>
			                            
			                        </div>
		                        <%
				                     // 검색일때 처리
				                    	String query = "";
				                    	if(sname != null){
				                    		query = "&searchname=" + sname + "&searchvalue=" + svalue;
				                    	}
		                    	
		                        %>
		                    
		                        <ul class="paging">
		                            <li><a href="?cpg=1"><i class="ri-arrow-left-double-line"></i></a></li>
		                            <li>
		                            <%
		                            	if(myPage.getStartPage()-1 == 0){
		                            %>
		                            		<a href="?cpg=<%=myPage.getStartPage() %><%=query %>"><i class="ri-arrow-left-s-line"></i></a>
		                            <%
		                            	}else{
		                            %>
		                            		<a href="?cpg=<%=myPage.getStartPage() -1 %><%=query %>"><i class="ri-arrow-left-s-line"></i></a>
		                            <%
		                            	}
		                            %>
		                            </li>
		                            <%
		                            	// 시작페이지 계산법 : (pg-1) * listCount + 1
		                            	// 마지막페이지 계산법 : 시작페이지 + listCount - 1
		                            	// if(마지막 페이지 > 전체 페이지){
		                            	// 		마지막 페이지 = 전체 페이지
		                            	// }
		                            	
		                            	for(int i=myPage.getStartPage(); i<=myPage.getEndPage(); i++){
		                            		if(pg == i){
		                            			out.println("<li><a href=\"?cpg=" + i + query + "\" class=\"active\">" + i + "</a></li>");
		                            		}else{
		                            			out.println("<li><a href=\"?cpg=" + i + query + "\">" + i + "</a></li>");
		                            		}
		                            %>
		                            <!-- 
		                            <li><a href="#" class="active">1</a></li>
		                            <li><a href="#">2</a></li>
		                            <li><a href="?cpg=<%=i %>"><%=i %></a></li>
		                             -->
		                            <%
		                            	}
		                            %>
		                            <li>
		                            <%
		                            	if(myPage.getEndPage()+1 > myPage.getTotalPages()){
		                            %>
		                            		<a href="?cpg=<%=myPage.getEndPage() %><%=query %>"><i class="ri-arrow-right-s-line"></i></a>
		                             <%
		                            	}else{
		                            %>
		                            		<a href="?cpg=<%=myPage.getEndPage() +1 %><%=query %>"><i class="ri-arrow-right-s-line"></i></a>
		                            <%
		                            	}
		                            %>
		                            </li>
		                            <li><a href="?cpg=<%=myPage.getTotalPages() %><%=query %>"><i class="ri-arrow-right-double-line"></i></a></li>
		                        </ul>
		                        
		               </div>
         </div><!-- /.tabsbox -->
       </div><!-- /.listbox-->    
			
 </section>
  

<jsp:include page="inc/footer.jsp" flush="true" />