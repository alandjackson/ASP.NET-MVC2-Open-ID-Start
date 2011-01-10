<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication1.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log On
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Content/OpenId.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        document.selectProvider = function (button, identifierTemplate) {
            $('#openid_identifier').val(identifierTemplate);
        };
    </script>
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">


    <h2>Log On</h2>

    <div id="openidlogin">

	<div style="display:block; height:90px;">
	    <div class="large buttons">
		    <div class="provider" onclick="document.selectProvider(this, 'https://www.google.com/accounts/o8/id')"><div><img src="../../Content/google.gif" alt="google"/></div></div>
		    <div class="provider" onclick="document.selectProvider(this, 'https://me.yahoo.com/')"><div><img src="../../Content/yahoo.gif" alt="yahoo"/></div></div>
		    <div class="provider" onclick="document.selectProvider(this, 'http://openid.aol.com/{username}')"><div><img src="../../Content/aol.gif" alt="aol"/></div></div>
		    <div class="provider" onclick="document.selectProvider(this, '')"><div><img src="../../Content/openid.gif" alt="openid"/></div></div>
	    </div>
	</div>
	    
	<form action="Authenticate?ReturnUrl=<%=HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]) %>" method="post">
	    <label for="openid_identifier">OpenID: </label>
	    <input id="openid_identifier" name="openid_identifier" size="40" />
	    <input type="submit" value="Login" />
	</form>

   
    <% if (!string.IsNullOrEmpty(ViewData["Message"] as string))
        { %> 
        <div class="logonError"><%= Html.Encode(ViewData["Message"]) %></div>
    <% } %>

    </div>

</asp:Content>
