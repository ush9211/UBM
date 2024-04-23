<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ubmProgram.dto.*, ubmProgram.dao.*, java.sql.Connection, java.util.ArrayList "  %>
<jsp:useBean id="db" class="ubmProgram.dao.DBConnect" scope="page" />
<jsp:include page="inc/header.jsp" flush="true" />
<%       
      
        /*
        //db연결 확인
        Connection conn = db.conn;
        UBMDao dao = new  UBMDao(conn);       	                       
        
          //전체 게시글의 수를 가져옴
         int cnt = dao.AllselectDB(); 
          */
          
          Connection conn = db.conn;
          UBMDao dao = new  UBMDao(conn);  
    
      
     
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
  

         </div><!-- /.tabsbox -->
       </div><!-- /.listbox-->    
			
 </section>
  

<jsp:include page="inc/footer.jsp" flush="true" />