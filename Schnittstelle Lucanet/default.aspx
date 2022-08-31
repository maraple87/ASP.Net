<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="Schnittstelle_Lucanet.page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="design.css" rel="stylesheet">
    <title>Schnittstelle zu LucaNet</title>

    
        <header  class="outer_header">
        
       <h2 class= "inner_header"  >
           <asp:Image ID="Image1" runat="server" Height="100px" ImageAlign="Middle" ImageUrl="~/logo_hst-3er_lwm_neu.jpg" Width="200px" BackColor="White" />
           
           &nbsp;&nbsp;&nbsp;&nbsp; Schnittstelle zu LucaNet&nbsp;

        <p class="inner_header_p"></p>
        </h2>
            
    </header>
    
</head>
<body >
    <div class="div_body">
    <form id="form1" runat="server">
        <%--    <header  class="outer_header">
        
        <img alt="" class="auto-style1" src="logo_hst-3er_lwm_neu.jpg" />&nbsp;&nbsp;&nbsp; Schnittstelle zu LucaNet&nbsp;<hr />
        </h2>
        <h2 class= "inner_header" >
            
    </header>--%>

        <div class="dropdown_procedure">
            <p class="dropdown" >Abfrage auswählen:</p>
            <asp:DropDownList ID="DropDownList_procedure" runat="server" AutoPostBack="True" CausesValidation="True">
                <asp:ListItem Value="Zusteller">Zustellcontrolling</asp:ListItem>
                <asp:ListItem Value="Beilagen">Beilagen/DV-Kosten</asp:ListItem>
            </asp:DropDownList>

        </div>

        <div class="outer_dropdown">
           

            <p class="dropdown" >Monat + Jahr auswählen:</p>
            
            <asp:DropDownList CssClass="dropdown" ID="DropDownList_Jahr" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Dropdown" DataTextField="JahrMonat" DataValueField="JahrMonat" CausesValidation="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_Dropdown" runat="server" ConnectionString="<%$ ConnectionStrings:HStSSiSConnectionString %>" SelectCommand="Anwendung_Schnittstelle_Lucanet" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2021" Name="iJahr" Type="Int32" />
                    <asp:Parameter DefaultValue="5" Name="iMonat" Type="Int32" />
                    <asp:Parameter DefaultValue="ListeJahrMonat" Name="Modus" Type="String" />
                    <asp:FormParameter DefaultValue="Zusteller" FormField="Ziel" Name="Ziel" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HStSSiSConnectionString %>" SelectCommand="Anwendung_Schnittstelle_Lucanet" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="iJahr" SessionField="Jahr" Type="Int32" DefaultValue="2021" />
                    <asp:SessionParameter Name="iMonat" SessionField="Monat" Type="Int32" DefaultValue="5" />
                    <asp:SessionParameter Name="Modus" SessionField="Typ" Type="String" DefaultValue="AnsichtLucaNet" />
                    <asp:SessionParameter Name="Ziel" SessionField="Ziel" Type="String" DefaultValue="Zusteller" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <div id="outer_button">
            
                <asp:Button name ="submit_button" CssClass="inner_button" ID="Button_Ansicht_Detail" runat="server" style="margin-bottom: 0px" Text="Ansicht Detail" />
            
                <asp:Button name ="submit_button" CssClass="inner_button" ID="Button_Ansicht_Lucanet" runat="server" style="margin-bottom: 0px" Text="Ansicht Lucanet" />

                <asp:Button CssClass="inner_button" ID="Button_Uebergabe_Lucanet" runat="server" style="margin-bottom: 0px" Text="Übergabe Lucanet" Enabled="False" ForeColor="#CC0000" />

                <asp:TextBox ID="TextBox" runat="server" BorderColor="White" BorderStyle="None" Font-Size="Large" ForeColor="#CC0000" Visible="False">Daten wurden versendet!</asp:TextBox>

        </div>
        <br />
        <br />

        <p style="font-family: Verdana, Geneva, Tahoma, Sans-Serif">Datenbank-Tabelle:</p>
        <br />  
        <div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
        </div>
    </form>
        </div>
</body>
</html>
