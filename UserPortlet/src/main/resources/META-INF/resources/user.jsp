<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.service.UserLocalServiceUtil" %>
<%@ page import="com.liferay.portal.kernel.model.User" %>
<%@ page import="com.liferay.portal.kernel.exception.PortalException" %>
<%@ page import="com.liferay.portal.kernel.service.UserLocalService" %>
<%@ page import="com.liferay.portal.kernel.service.UserLocalService" %>
<%@ page import="ru.utils.Utils" %>
<%@ include file="init.jsp" %>

<jsp:useBean id="userServce" class="com.liferay.portal.kernel.service.UserLocalServiceUtil"/>
<%
    String redirect = ParamUtil.getString(request, "backURL");
    long userId = ParamUtil.getLong(request, "userId");
    User userData = null;
    try {
        userData = UserLocalServiceUtil.getUser(userId);
    } catch (PortalException e) {
        e.printStackTrace();
    }
%>

<body>
<br>
<h2>
    <strong><liferay-ui:message key="user-card"/></strong>
</h2>
<br/>
<aui:model-context bean="<%= userData %>" model="<%= UserLocalService.class %>"/>

<div class="form-group">

    <h4><liferay-ui:message key="user-fullName"/></h4><%=userData.getFullName() %> <br/>
    <h4><liferay-ui:message key="user-email"/></h4><%=userData.getEmailAddress() %> <br/>
    <h4><liferay-ui:message
            key="user-birthday"/></h4><%= Utils.getDateToTextLocale(userData.getBirthday()) %> <br/>
    <h4><liferay-ui:message key="user-post"/></h4><%=userData.getJobTitle()%> <br/>

    <h4><liferay-ui:message key="user-phones"/></h4>
    <table cellpadding="0" cellspacing="0">
        <c:forEach items="<%=userData.getPhones()%>" var="phone">
            <tr>
                <td><c:out value="${phone.number}"/></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <h4><liferay-ui:message key="user-organization"/></h4>
    <table cellpadding="0" cellspacing="0">
        <c:forEach items="<%=userData.getOrganizations()%>" var="organization">
            <tr>
                <td><c:out value="${organization.name}"/></td>
            </tr>
        </c:forEach>
    </table>
    <br/>

    <br/>
    <aui:button href="<%= redirect %>" value="back" type="cancel"/>
</div>

</body>