<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">공지사항</h3>
	 <p class="px-0">마이팜 공지사항</p>
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="ui-board notice">
			<table width="100%">
				<colgroup>
					<col width="100px" />
					<col  />
					<col width="120px"/>
					<col width="120px"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="text-title"><span><a href="#">공지사항 글입니다.</a></span></td>
						<td>관리자</td>
						<td>2023.12.28</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="text-title"><span><a href="#">공지사항 글입니다.</a></span></td>
						<td>관리자</td>
						<td>2023.12.28</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="text-title"><span><a href="#">공지사항 글입니다.</a></span></td>
						<td>관리자</td>
						<td>2023.12.28</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="text-title"><span><a href="#">공지사항 글입니다.</a></span></td>
						<td>관리자</td>
						<td>2023.12.28</td>
					</tr>
				</tbody>
			</table>
			
			<!-- pagination -->
			<div class="pagination-wrap pt-5 pb-3">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			
		</div>
	</div>
</div>