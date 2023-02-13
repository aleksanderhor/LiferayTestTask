<%@ page import="ru.utils.Utils" %>
<%@ page import="com.liferay.portal.kernel.service.UserLocalServiceUtil" %>
<%@ include file="init.jsp" %>
<body>

<strong><liferay-ui:message key="users-list"/></strong>

<liferay-ui:search-container emptyResultsMessage="no-users-found">
	<liferay-ui:search-container-results results="<%= UserLocalServiceUtil.getUsers(-1,-1) %>">
	</liferay-ui:search-container-results>
	<liferay-ui:search-container-row className="com.liferay.portal.kernel.model.User" modelVar="userData"
									 keyProperty="userId">
		<liferay-portlet:renderURL varImpl="userUrl">
			<portlet:param name="backURL" value="<%= currentURL %>"/>
			<portlet:param name="mvcPath" value="/user.jsp"/>
			<portlet:param name="userId" value="<%= String.valueOf(userData.getUserId()) %>"/>
		</liferay-portlet:renderURL>

		<liferay-ui:search-container-column-text property="userId" name="user-id"/>
		<liferay-ui:search-container-column-text property="fullName" href="<%=userUrl%>" name="user-fullName"/>
		<liferay-ui:search-container-column-text property="emailAddress" name="user-email"/>
		<liferay-ui:search-container-column-text property="jobTitle" name="user-post"/>
		<liferay-ui:search-container-column-text name="user-birthday">
			<h4><%= Utils.getDateToTextLocale(userData.getBirthday()) %></h4>
		</liferay-ui:search-container-column-text>
		<liferay-ui:search-container-column-text name="user-phones">
			<table cellpadding="0" cellspacing="0" border="0">
				<c:forEach items="${userData.phones}" var="phone">
					<tr>
						<td><c:out value="${phone.number}"/></td>
					</tr>
				</c:forEach>
			</table>
		</liferay-ui:search-container-column-text>
		<liferay-ui:search-container-column-text name="user-organization">
			<table cellpadding="0" cellspacing="0" border="0">
				<c:forEach items="${userData.organizations}" var="organization">
					<tr>
						<td><c:out value="${organization.name}"/></td>
					</tr>
				</c:forEach>
			</table>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator/>
</liferay-ui:search-container>

</body>