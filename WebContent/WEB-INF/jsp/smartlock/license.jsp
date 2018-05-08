<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
    <jsp:param name="_nav" value="license" />
</jsp:include>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">라이선스 관리</h1>
        </div>
        <!-- 검색필터-->
        <div class="row">
            <div style="float:right;">
                <select class="col-md-4" name="" id="location1" style="width:130px;height:35px;">
                    <option value="">전체</option>
                    <option value="">소프트웨어명</option>
                    <option value="">회사명</option>
                    <option value="">사용자명</option>
                </select>
                <input type="text" class="col-md-4" placeholder="검색어를 입력하세요" id="searchField"  style="width:300px;height:35px;">&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="searchButton" data-loading-text="Searching.."><i class="fa fa-search"></i></button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-center">
            </h2>
        </div>
        <div id="no-more-tables">
            <table class="col-sm-12 table-bordered table-striped table-condensed cf">
                <thead class="cf" align="center">
                <tr>
                    <td width="10px"><h4><b>No.</h4></td>
                    <td><h4><b>소프트웨어</h4></td>
                    <td><h4><b>회사명</h4></td>
                    <td width="150px"><h4><b>사용자</h4></td>
                    <td><h4><b>기기명</h4></td>
                    <td width="150px"><h4><b>시작일자</h4></td>
                    <td width="150px"><h4><b>만료일자</h4></td>
                    <td width="150px"><h4><b>상태</h4></td>
                </tr>
                </thead>
                <tbody align="center">
                <tr>
                    <td data-title="No.">1</td>
                    <td data-title="소프트웨어">SmartCAD</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">호날두</td>
                    <td data-title="기기명">Galaxy S7</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-warning">데모</span></td>

                </tr>
                <tr>
                    <td data-title="No.">2</td>
                    <td data-title="소프트웨어">SmartCAD</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">메시</td>
                    <td data-title="기기명">iPhone 7+</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-success">승인</span></td>

                </tr>
                <tr>
                    <td data-title="No.">3</td>
                    <td data-title="소프트웨어">SmartCAD</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">산체스</td>
                    <td data-title="기기명">SAMSUNG Haptic</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-danger">대기</span></td>

                </tr>
                <tr>
                    <td data-title="No.">4</td>
                    <td data-title="소프트웨어">SmartCAD</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">박지성</td>
                    <td data-title="기기명">LG G6</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-warning">데모</span></td>

                </tr>
                <tr>
                    <td data-title="No.">5</td>
                    <td data-title="소프트웨어">한컴오피스</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">호날두</td>
                    <td data-title="기기명">Magic Hole</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-success">승인</span></td>
                </tr>
                <tr>
                    <td data-title="No.">6</td>
                    <td data-title="소프트웨어">한컴오피스</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">호날두</td>
                    <td data-title="기기명">Xiaomi-Mi-Max2</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-warning">데모</span></td>
                </tr>
                <tr>
                    <td data-title="No.">7</td>
                    <td data-title="소프트웨어">한컴오피스</td>
                    <td data-title="회사명">캐드서브</td>
                    <td data-title="사용자">호날두</td>
                    <td data-title="기기명">Galaxy S2</td>
                    <td data-title="시작일자">2017-04-01</td>
                    <td data-title="만료일자">2017-05-01</td>
                    <td data-title="상태"><span class="label label-danger">대기</span></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<hr>
<!-- /.row -->
<hr>
<!-- Pagination -->
<div class="row text-center">
    <div class="col-lg-12">
        <ul class="pagination">
            <li>
                <a href="#">&laquo;</a>
            </li>
            <li class="active">
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#">&raquo;</a>
            </li>
        </ul>
    </div>
</div>

<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />