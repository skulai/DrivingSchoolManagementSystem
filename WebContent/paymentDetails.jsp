<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Payment Information</title>
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>   
</head>
<body>
	<form method="post" action="payment">
		<table width=518 border="0" cellpadding="0" cellspacing="0"
			bgcolor="#FFFFFF">
			<tr bgcolor="#E5E5E5">
				<td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Billing
						Information (required)</strong></td>
			</tr>
			<tr>
				<td height="22" width="180" align="right" valign="middle">First
					Name:</td>
				<td colspan="2" align="left"><input name="firstName"
					type="text" size="50"></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">Last Name:</td>
				<td colspan="2" align="left"><input name="lastName" type="text"
					size="50"></td>
			</tr>
			
			<tr>
				<td height="22" align="right" valign="middle">Street Address:</td>
				<td colspan="2" align="left"><input name="address" type="text"
					value="" size="50"></td>
			</tr>
			
			<tr>
				<td height="22" align="right" valign="middle">Zip/Postal Code:</td>
				<td colspan="2" align="left"><input name="zip" type="text"
					value="" size="50"></td>
			</tr>
			
			<tr>
				<td height="22" colspan="3" align="left" valign="middle">&nbsp;</td>
			</tr>
			<tr bgcolor="#E5E5E5">
				<td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Credit
						Card (required)</strong></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">Credit Card
					Number:</td>
				<td colspan="2" align="left"><input name="CCNo" type="text"
					value="" size="19" maxlength="40"></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">CVC:</td>
				<td colspan="2" align="left"><input name="CVC" type="text"
					value="" size="3" maxlength="3"></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">Expiry Date:</td>
				<td colspan="2" align="left"><SELECT NAME="CCExpiresMonth">
						<OPTION VALUE="" SELECTED>--Month--
						<OPTION VALUE="01">January (01)
						<OPTION VALUE="02">February (02)
						<OPTION VALUE="03">March (03)
						<OPTION VALUE="04">April (04)
						<OPTION VALUE="05">May (05)
						<OPTION VALUE="06">June (06)
						<OPTION VALUE="07">July (07)
						<OPTION VALUE="08">August (08)
						<OPTION VALUE="09">September (09)
						<OPTION VALUE="10">October (10)
						<OPTION VALUE="11">November (11)
						<OPTION VALUE="12">December (12)
				</SELECT> / <SELECT NAME="CCExpiresYear">
						<OPTION VALUE="" SELECTED>--Year--
						<OPTION VALUE="04">2004
						<OPTION VALUE="05">2005
						<OPTION VALUE="06">2006
						<OPTION VALUE="07">2007
						<OPTION VALUE="08">2008
						<OPTION VALUE="09">2009
						<OPTION VALUE="10">2010
						<OPTION VALUE="11">2011
						<OPTION VALUE="12">2012
						<OPTION VALUE="13">2013
						<OPTION VALUE="14">2014
						<OPTION VALUE="15">2015
				</SELECT></td>
			</tr>
			<tr>
				<td height="22" colspan="3" align="left" valign="middle">&nbsp;</td>
			</tr>
			<tr bgcolor="#E5E5E5">
				<td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Additional
						Information</strong></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">Contact Email:</td>
				<td colspan="2" align="left"><input name="contactEmail"
					type="text" value="" size="50"></td>
			</tr>
			<tr>
				<td height="22" colspan="3" align="left" valign="middle">&nbsp;</td>
			</tr>
			<tr bgcolor="#E5E5E5">
				<td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Amount
						to be Paid</strong></td>
			</tr>
			<tr>
				<td height="22" align="right" valign="middle">Amount:</td>
				<td colspan="2" align="left">
					<input type="text" value="${courseFee}" name="courseFee"> 
				</td>
			</tr>
		</table>
		<p>
			<input name="Submit" type="submit" value="Send Secure Form &gt;&gt;">
		</p>
	</form>
</body>
</html>

