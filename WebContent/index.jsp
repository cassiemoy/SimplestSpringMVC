
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onelogin.saml.*,com.onelogin.*" %>

<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Simplest Spring MVC</title>
	</head>
  
  <body>

		<%
		  if (request.getParameter("sendAuthRequest") != null) {
			  // the appSettings object contain application specific settings used by the SAML library
			  AppSettings appSettings = new AppSettings();
			  // set the URL of the consume.jsp (or similar) file for this app. The SAML Response will be posted to this URL
			  appSettings.setAssertionConsumerServiceUrl("http://localhost:8080/SimplestSpringMVC/consume.jsp");
			  // set the issuer of the authentication request. This would usually be the URL of the issuing web application
			  appSettings.setIssuer("https://app.onelogin.com/saml/metadata/421788");
			  
			  // the accSettings object contains settings specific to the users account. 
			  // At this point, your application must have identified the users origin
			  AccountSettings accSettings = new AccountSettings();
			  // The URL at the Identity Provider where to the authentication request should be sent
			  accSettings.setIdpSsoTargetUrl("https://app.onelogin.com/trust/saml2/http-post/sso/421788");
			  
			  // Generate an AuthRequest and send it to the identity provider
			  AuthRequest authReq = new AuthRequest(appSettings, accSettings);
			  String reqString = accSettings.getIdp_sso_target_url()+"?SAMLRequest=" + URLEncoder.encode(authReq.getRequest(AuthRequest.base64),"UTF-8");
			  System.out.println(reqString);
			  response.sendRedirect(reqString);
		  }
		%>

    <p><a href="welcome.html">Click to test Spring MVC controller - go to welcome.</a></p>

		<form name="requestForm" method="post">
			<input type="hidden" name="sendAuthRequest">
			<input type="button" value="Send Auth Request" onclick="sendAuthRequestButton()">
		</form>

		<script language="JavaScript">
		  <!--
				function sendAuthRequestButton(){
					document.requestForm.sendAuthRequest.value = "yes";
					console.log("Clicking button");
					requestForm.submit();	
				}
		  //-->
		</script>

  </body>
</html>