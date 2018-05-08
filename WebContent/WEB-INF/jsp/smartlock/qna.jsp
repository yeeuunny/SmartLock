<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<String[]> list = new ArrayList<>();
    list.add(new String[] {
            "서비스 사용료가 얼마인가요?",
            "3개월 무료 체험 후 인원수에 따라 300~900 만원의 비용으로 구입하실 수 있습니다."
    });
    list.add(new String[] {
            "정식 버전, 데모 버전의 차이가 무엇인가요?",
            "정식 버전은 1년, 데모 버전은 30일 단위로 라이선스 요청을 통해 라이선스를 갱신해야합니다."
    });
    list.add(new String[] {
            "에이전트가 무엇인가요?",
            "소프트웨어가 정상적으로 실행될 수 있도록 라이선스를 인증 받는 프로그램입니다."
    });
    list.add(new String[] {
            "단말기 등록은 어떻게 하나요?",
            "에이전트를 다운로드 받아 실행하면 단말기 등록을 진행할 수 있습니다."
    });
    list.add(new String[] {
            "라이선스는 어떻게 발급받나요?",
            "사용자의 소프트웨어 화면에서 라이선스를 요청하면 라이선스 관리자가 승인후에 발급받게됩니다."
    });
    list.add(new String[] {
            "라이선스를 발급받으면 어떻게 적용하나요?",
            "라이선스를 발급받고나면 자동적으로 에이전트가 소유여부를 식별하여 정상작동하게 됩니다."
    });
%>

<jsp:include page="include/_header.jsp">
    <jsp:param name="_nav" value="qna" />
</jsp:include>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">도움말
                <!--<small>Page Not Found</small>-->
            </h1>
            <!--
            <ol class="breadcrumb">
                <li><a href="404.jsp">Home</a>
                </li>
                <li class="active">404</li>
            </ol>
            -->
        </div>
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-md-7">
            <div style="padding: 8px">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <% for (int i = 0; i < list.size(); i++) { %>
                    <% String[] item = list.get(i); %>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="heading<%=i%>">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>" aria-expanded="true" aria-controls="collapse<%=i%>">
                                    <%=item[0]%>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse<%=i%>" class="panel-collapse collapse <%=(i==0?"in":"")%>" role="tabpanel" aria-labelledby="heading<%=i%>">
                            <div class="panel-body">
                                <%=item[1]%>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="col-md-5" style="text-align: center;">
            <div style="padding: 8px;">
                <a href="/front/doc/smartlock-manual-20171011-2.pdf" style="color: #000; text-underline: none; display: block;" download>
                    <div style="background-color: #FAFAFA; border: 1px solid #EEEEEE;">
                        <div style="padding: 96px 0;">
                            <div style="font-size: 36px;">
                                매뉴얼 다운로드
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div style="padding: 8px;">
                <div style="background-color: #FAFAFA; border: 1px solid #EEEEEE;">
                    <div style="padding: 96px 0; line-height: 1.4;">
                        <div style="font-size: 32px;">기술 지원 센터</div>
                        <div style="font-size: 24px;">Email : cadserv@nate.com</div>
                        <div style="font-size: 24px;">H.P : 010-6286-7339</div>
                    </div>
                </div>
            </div>
        </div>
        <!--
        <div class="col-lg-12">
            <div class="jumbotron">
                <h1><span class="error-404">화면이 없어요 :)</span>
                </h1>
                <p>화면을 아직 안만들었어요.</p>
            </div>
        </div>
        -->
    </div>
</div>
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />


<jsp:include page="include/_jslib.jsp" />