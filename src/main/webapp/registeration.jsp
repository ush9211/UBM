<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.PDto, ubmProgram.dao.*, java.sql.Connection "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%       
      
                
        Connection conn = db.conn;
        UBMDao dao = new  UBMDao(conn);       	                       
        
          //전체 게시글의 수를 가져옴*/
         int cnt = dao.AllselectDB(); 
     
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
                                        <col>
                                        <col width="5%">
                                        <col>
                                        <col width="20%">
                                        <col>
                                        <col>
                                        <col>
                                        <col width="7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>삭제</th>
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
                                        <col>
                                        <col width="5%">
                                        <col>
                                        <col width="20%">
                                        <col>
                                        <col>
                                        <col>
                                        <col width="7%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>삭제</th>
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
            
                                        <!-- /loop -->
                                    </tbody>
                                </table>
                                
                                
                             </div> <!-- /.list-inbox -->
                             <table cellspacing="5" align="center" border="1" bordercolor="#5CD1E5" width="600" height="600">
								<p></p>
								<caption>
									<font size="5" color="#4daace">시간표</font>
								</caption>
								<tr align="center">
									<td width="100"></td>
									<td width="100" bgcolor="#5CD1E5">월</td>
									<td width="100" bgcolor="#5CD1E5">화</td>
									<td width="100" bgcolor="#5CD1E5">수</td>
									<td width="100" bgcolor="#5CD1E5">목</td>
									<td width="100" bgcolor="#5CD1E5">금</td>
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
                        </div> <!-- /#wish -->
                      
                   
                </div> <!-- /.tabbox -->          
         


      
          
                     

         </div><!-- /.tabsbox -->
       </div><!-- /.listbox-->


<jsp:include page="inc/footer.jsp" flush="true" />