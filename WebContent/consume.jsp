<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.onelogin.*,com.onelogin.saml.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SAML Assertion Page</title>
</head>
<body>
<% String certificateS ="MIIDJzCCApCgAwIBAgIUE2m9Ecb4+PM5t/HAl5aEKyuaM5gwDQYJKoZIhvcNAQEF"+
"BQAwXzELMAkGA1UEBhMCVVMxGDAWBgNVBAoMD0J5dGUgQ29uc3VsdGluZzEVMBMG"+
"A1UECwwMT25lTG9naW4gSWRQMR8wHQYDVQQDDBZPbmVMb2dpbiBBY2NvdW50IDU0"+
"NzMzMB4XDTE1MDExMzAyNTU0NloXDTIwMDExNDAyNTU0NlowXzELMAkGA1UEBhMC"+
"VVMxGDAWBgNVBAoMD0J5dGUgQ29uc3VsdGluZzEVMBMGA1UECwwMT25lTG9naW4g"+
"SWRQMR8wHQYDVQQDDBZPbmVMb2dpbiBBY2NvdW50IDU0NzMzMIGfMA0GCSqGSIb3"+
"DQEBAQUAA4GNADCBiQKBgQDdzW2Jy3xKxMCWSkMbwCHW8ae7pNu4D+L3gfBsELOq"+
"JD2uqSxs1TySNFKXRthLbzAjBgGl/hFEz65ojyyf6/T6RYn/z76pDd81kOHdYTzo"+
"OTgLV/NRxrBH1FZuG23stCCAQBqPjE2IJeEz5DnQkCokOmoWRruJiGKk+bwmxAAM"+
"lwIDAQABo4HfMIHcMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFN+uQXDnScH1EWR2"+
"8cSuVeXhEI69MIGcBgNVHSMEgZQwgZGAFN+uQXDnScH1EWR28cSuVeXhEI69oWOk"+
"YTBfMQswCQYDVQQGEwJVUzEYMBYGA1UECgwPQnl0ZSBDb25zdWx0aW5nMRUwEwYD"+
"VQQLDAxPbmVMb2dpbiBJZFAxHzAdBgNVBAMMFk9uZUxvZ2luIEFjY291bnQgNTQ3"+
"MzOCFBNpvRHG+PjzObfxwJeWhCsrmjOYMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG"+
"9w0BAQUFAAOBgQBvGVTmWX0wtrx6vDg2iPoXKAVE+LQiBWuPBbsmTJl73K83oi5N"+
"cbxNXsqDxRNAzSJm1VKeYagn6r0RXtw2T3xfEc+077qGR0LWoO1DUtsdV3P6DwUJ"+
"XplJbIyDjEQmEnmyE/mPHq4u1ahxxzCYqcZPteNc8gOp422ovB8bF79n9w=="; 

  // user account specific settings. Import the certificate here
  AccountSettings accountSettings = new AccountSettings();
  accountSettings.setCertificate(certificateS);
  System.out.println(accountSettings.getCertificate());
  
  Response samlResponse = new Response(accountSettings);
  samlResponse.loadXmlFromBase64(request.getParameter("SAMLResponse"));
  samlResponse.setDestinationUrl(request.getRequestURL().toString()); 
  
  if (samlResponse.isValid()) {

    // the signature of the SAML Response is valid. The source is trusted
  	java.io.PrintWriter writer = response.getWriter();
  	writer.write("OK!");
  	String nameId = samlResponse.getNameId();
  	writer.write(nameId);
  	writer.flush();
	
  } else {

    // the signature of the SAML Response is not valid
  	java.io.PrintWriter writer = response.getWriter();
  	writer.write("Failed");
  	writer.flush();

  }
%>
</body>
</html>