<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/display/init.jsp" %>

<%
String tabs2 = ParamUtil.getString(request, "tabs2", "general");
String tabs3 = ParamUtil.getString(request, "tabs3", "article");
%>

<liferay-portlet:renderURL portletConfiguration="true" var="portletURL">
	<portlet:param name="tabs2" value="<%= tabs2 %>" />
	<portlet:param name="tabs3" value="<%= tabs3 %>" />
</liferay-portlet:renderURL>

<%
String tabs2Names = "general,display-settings";

if (PortalUtil.isRSSFeedsEnabled()) {
	tabs2Names += ",rss";
}
%>

<liferay-ui:tabs
	names="<%= tabs2Names %>"
	param="tabs2"
	url="<%= portletURL %>"
/>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationURL" />

<aui:form action="<%= configurationURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="tabs2" type="hidden" value="<%= tabs2 %>" />
	<aui:input name="tabs3" type="hidden" value="<%= tabs3 %>" />

	<aui:fieldset>
		<c:choose>
			<c:when test='<%= tabs2.equals("general") %>'>
				<div class="kb-field-wrapper">
					<aui:field-wrapper label="order-by">
						<aui:select inlineField="<%= true %>" label="" name="preferences--kbArticlesOrderByCol--">
							<aui:option label="author" selected='<%= kbArticlesOrderByCol.equals("user-name") %>' value="user-name" />
							<aui:option label="create-date" selected='<%= kbArticlesOrderByCol.equals("create-date") %>' />
							<aui:option label="modified-date" selected='<%= kbArticlesOrderByCol.equals("modified-date") %>' />
							<aui:option label="priority" selected='<%= kbArticlesOrderByCol.equals("priority") %>' />
							<aui:option label="title" selected='<%= kbArticlesOrderByCol.equals("title") %>' />
							<aui:option label="view-count" selected='<%= kbArticlesOrderByCol.equals("view-count") %>' />
						</aui:select>

						<aui:select inlineField="<%= true %>" label="" name="preferences--kbArticlesOrderByType--">
							<aui:option label="ascending" selected='<%= kbArticlesOrderByType.equals("asc") %>' value="asc" />
							<aui:option label="descending" selected='<%= kbArticlesOrderByType.equals("desc") %>' value="desc" />
						</aui:select>
					</aui:field-wrapper>

					<aui:input label="show-priority-column" name="preferences--showKBArticlePriorityColumn--" type="checkbox" value="<%= showKBArticlePriorityColumn %>" />

					<aui:input label="show-author-column" name="preferences--showKBArticleAuthorColumn--" type="checkbox" value="<%= showKBArticleAuthorColumn %>" />

					<aui:input label="show-create-date-column" name="preferences--showKBArticleCreateDateColumn--" type="checkbox" value="<%= showKBArticleCreateDateColumn %>" />

					<aui:input label="show-modified-date-column" name="preferences--showKBArticleModifiedDateColumn--" type="checkbox" value="<%= showKBArticleModifiedDateColumn %>" />

					<aui:input label="show-status-column" name="preferences--showKBArticleStatusColumn--" type="checkbox" value="<%= showKBArticleStatusColumn %>" />

					<aui:input label="show-views-column" name="preferences--showKBArticleViewsColumn--" type="checkbox" value="<%= showKBArticleViewsColumn %>" />
				</div>
			</c:when>
			<c:when test='<%= tabs2.equals("display-settings") %>'>
				<liferay-ui:tabs
					names="article,template"
					param="tabs3"
					url="<%= portletURL %>"
				/>

				<c:choose>
					<c:when test='<%= tabs3.equals("article") %>'>
						<aui:input label="enable-description" name="preferences--enableKBArticleDescription--" type="checkbox" value="<%= enableKBArticleDescription %>" />

						<aui:input label="enable-ratings" name="preferences--enableKBArticleRatings--" type="checkbox" value="<%= enableKBArticleRatings %>" />

						<aui:input label="show-asset-entries" name="preferences--showKBArticleAssetEntries--" type="checkbox" value="<%= showKBArticleAssetEntries %>" />

						<aui:input label="enable-comments" name="preferences--enableKBArticleKBComments--" type="checkbox" value="<%= enableKBArticleKBComments %>" />

						<aui:input label="show-comments" name="preferences--showKBArticleKBComments--" type="checkbox" value="<%= showKBArticleKBComments %>" />

						<aui:input label="enable-view-count-increment" name="preferences--enableKBArticleViewCountIncrement--" type="checkbox" value="<%= enableKBArticleViewCountIncrement %>" />
					</c:when>
					<c:when test='<%= tabs3.equals("template") %>'>
						<aui:input label="enable-comments" name="preferences--enableKBTemplateKBComments--" type="checkbox" value="<%= enableKBTemplateKBComments %>" />

						<aui:input label="show-comments" name="preferences--showKBTemplateKBComments--" type="checkbox" value="<%= showKBTemplateKBComments %>" />
					</c:when>
				</c:choose>
			</c:when>
			<c:when test='<%= tabs2.equals("rss") %>'>
				<liferay-ui:rss-settings
					delta="<%= rssDelta %>"
					displayStyle="<%= rssDisplayStyle %>"
					enabled="<%= enableRSS %>"
					feedType="<%= rssFeedType %>"
				/>
			</c:when>
		</c:choose>

		<aui:button-row cssClass="kb-submit-buttons">
			<aui:button type="submit" />
		</aui:button-row>
	</aui:fieldset>
</aui:form>