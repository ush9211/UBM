<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.PDto,
				ubmProgram.dao.*,
				ubmProgram.dto.*,
				ubmProgram.service.*,
				java.sql.Connection,
				java.util.ArrayList,
				java.sql.Timestamp,
                java.text.SimpleDateFormat,
                java.text.NumberFormat "  %>
<jsp:useBean id="dbs" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%  

		//세션 객체를 얻음
		HttpSession sess = request.getSession(true);
		
		String sname = request.getParameter("searchname");
		String svalue = request.getParameter("searchvalue");
		
		ServletContext cont = getServletContext();
                
        Connection conn = dbs.conn;
        UBMDao dao = new  UBMDao(conn);       	                       
        
          
         /********* 페이징 변수 ************/
     	
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
    	cnt = dao.AllselectDB(); 
    	
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
			<div class="listbox">

                   <div class="tabsbox">
                      <ul class="tabnav">
                          <li class="active"><a href="#open">개설과목</a></li>
                          <li><a href="#wish">희망과목</a></li>
                      </ul>
                      <div class="line-box"></div>
                      
                      <div class="tabbox regist">
                         <div class="tab active" id="open">
                         
                            <div class="searchbox">
		                        <div class="search1 mb-3 col-12">
		                           <p class="col-2">개설과목 조회</p>
		                           <div class="dropdown col-4">
		                              <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
		                                  학과명
		                              </button>
		                              <div class="dropdown-menu">
		                                 <a class="dropdown-item" href="#">경제학</a>
		                                 <a class="dropdown-item" href="#">정치학</a>
		                                 <a class="dropdown-item" href="#">경영학</a>
		                              </div>
		                           </div>
		                           <div class="dropdown col-4">
		                              <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
		                                  수업명
		                              </button>
		                              <div class="dropdown-menu">
		                                 <a class="dropdown-item" href="#">경제학1</a>
		                                 <a class="dropdown-item" href="#">경제학2</a>
		                                 <a class="dropdown-item" href="#">경제학3</a>
		                              </div>
		                           </div>
		                           <button class="btn btn-primary col-2"><i class="ri-search-line"></i>&nbsp;조회</button>
		                        </div>
		                        <div class="search2 mb-3 col-12">
		                           <p class="col-2">키워드 검색</p>
		                           <div class="dropdown col-4 keyword">
		                              <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
		                                  키워드
		                              </button>
		                              <div class="dropdown-menu">
		                                 <a class="dropdown-item" href="#">학과명</a>
		                                 <a class="dropdown-item" href="#">수업명</a>
		                                 <a class="dropdown-item" href="#">교수명</a>
		                              </div>
		                           </div>
		                           <input type="text" class="textbox" />
		                           <button class="btn btn-primary col-2"><i class="ri-search-line"></i>&nbsp;조회</button>
		                        </div>
		                     </div>
		                     
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
            							<!-- loop -->
            							<%
			                            	// 게시글 번호
			                            	int num = cnt - limitPage;
			                            
			                            	for(int i=0; i<list.size(); i++){
			                            		CDto dto = list.get(i);
			                            		int c_id = dto.getC_id();
			                            		String c_name = dto.getC_name();
			                            		int grade = dto.getGrade();
			                            		String when = dto.getWhen();
			                            		String where = dto.getWhere();
			                            		int p_id = dto.getP_id();
			                            		int d_id = dto.getD_id();
			                            %>
			                            <tr>
			                                <td class="text-center"><%=num %></td>
			                                <td class="text-center"><%=depart %></td>
			                                <td class="text-center"><%=grade %></td>
			                                <td class="text-center">신청</td>
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
			                               		<a href="javascript:void(0)"><%=title %></a>
			                                    <span></span>
			                                    <!--  
			                                    <i class="ri-file-image-fill"></i>
			                                    <i class="ri-file-pdf-2-fill"></i>
			                                    <i class="ri-file-hwp-fill"></i>
			                                    -->
			                                </td>
			                              <% } %>
			                                <td class="text-center"><%=p_name %></td>
			                                <td class="text-center"><%=wdate %></td>
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
                                        
                                        <!-- /loop -->
                                    </tbody>
                                </table>
                                
                                
                             </div> <!-- /.list-inbox -->
                             <div class="col-3">
						          <table class="timetable" cellspacing="5" align="center" border="1" bordercolor="#5CD1E5" width="300" height="300">
										<p></p>
									
										<tr align="center">
											<td width="50"></td>
											<td width="50" bgcolor="#5CD1E5">월</td>
											<td width="50" bgcolor="#5CD1E5">화</td>
											<td width="50" bgcolor="#5CD1E5">수</td>
											<td width="50" bgcolor="#5CD1E5">목</td>
											<td width="50" bgcolor="#5CD1E5">금</td>
										</tr>
								
										<tr align="center" >
											<td>1교시<p>(9-10시)</p></td>
											<td id="mon1">${mon1}</td>
											<td id="tue1">${tue1}</td>
											<td id="wed1">${wed1}</td>
											<td id="tur1">${tur1}</td>
											<td id="fri1">${fri1}</td>
										</tr>
								
										<tr align="center">
											<td>2교시<p>(10-11시)</p></td>
											<td id="mon2">${mon2}</td>
											<td id="tue2">${tue2}</td>
											<td id="wed2">${wed2}</td>
											<td id="tur2">${tur2}</td>
											<td id="fri2">${fri2}</td>
										</tr>
								
										<tr align="center">
											<td>3교시<p>(11-12시)</p></td>
											<td id="mon3">${mon3}</td>
											<td id="tue3">${tue3}</td>
											<td id="wed3">${wed3}</td>
											<td id="tur3">${tur3}</td>
											<td id="fri3">${fri3}</td>
										</tr>
								
										<tr align="center">
											<td>4교시<p>(12-13시)</p></td>
											<td id="mon4">${mon4}</td>
											<td id="tue4">${tue4}</td>
											<td id="wed4">${wed4}</td>
											<td id="tur4">${tur4}</td>
											<td id="fri4">${fri4}</td>
										</tr>
								
										<tr align="center">
											<td>5교시<p>(13-14시)</p></td>
											<td id="mon5">${mon5}</td>
											<td id="tue5">${tue5}</td>
											<td id="wed5">${wed5}</td>
											<td id="tur5">${tur5}</td>
											<td id="fri5">${fri5}</td>
										</tr>
								
										<tr align="center">
											<td>6교시<p>(14-15시)</p></td>
											<td id="mon6">${mon6}</td>
											<td id="tue6">${tue6}</td>
											<td id="wed6">${wed6}</td>
											<td id="tur6">${tur6}</td>
											<td id="fri6">${fri6}</td>
										</tr>
								
										<tr align="center">
											<td>7교시<p>(15-16시)</p></td>
											<td id="mon7">${mon7}</td>
											<td id="tue7">${tue7}</td>
											<td id="wed7">${wed7}</td>
											<td id="tur7">${tur7}</td>
											<td id="fri7">${fri7}</td>
										</tr>
								
										<tr align="center">
											<td>8교시<p>(16-17시)</p></td>
											<td id="mon8">${mon8}</td>
											<td id="tue8">${tue8}</td>
											<td id="wed8">${wed8}</td>
											<td id="tur8">${tur8}</td>
											<td id="fri8">${fri8}</td>
										</tr>   
								        	<tr align="center">
											<td>9교시<p>(17-18시)</p></td>
											<td id="mon9">${mon9}</td>
											<td id="tue9">${tue9}</td>
											<td id="wed9">${wed9}</td>
											<td id="tur9">${tur9}</td>
											<td id="fri9">${fri9}</td>
										</tr>
								
										<tr align="center">
											<td></td>
											<td colspan="5" bgcolor="#5CD1E5">이젠대학교 경영학과			
											</td>
										</tr>
									</table>    
								</div>
                        </div> <!-- /#wish -->
                      
                   
                </div> <!-- /.tabbox -->          
  

         </div><!-- /.tabsbox -->
       </div><!-- /.listbox-->

<jsp:include page="inc/footer.jsp" flush="true" />