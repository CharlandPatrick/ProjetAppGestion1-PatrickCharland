<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifierJoueur.aspx.cs" Inherits="modifierJoueur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="formModifierJoueur" runat="server">
    <div>  
        <h1>Modifier un joueur</h1>
    </div>
    <div>
        <h2>Joueur à modifier:<asp:DropDownList ID="DropDownListModifier" 
                                            runat="server" 
                                            Height="30px" 
                                            style="margin-left: 21px" 
                                            Width="280px" AutoPostBack="True" 
                                            OnSelectedIndexChanged="DropDownListModifier_SelectedIndexChanged">
                              </asp:DropDownList></h2>
    </div>
    <div>
        <h2>Modification:<asp:TextBox ID="TextBoxModifier" 
                                    runat="server" 
                                    Width="280px" 
                                    style="margin-left: 68px" 
                                    Height="20px">
                         </asp:TextBox></h2>
    </div>
    <div>
        <asp:Button ID="buttonModifierJoueur" 
                    runat="server" 
                    Text="Modifier" 
                    Width="170px" 
                    style="margin-left: 0px" 
                    Enabled="False" 
                    OnClick="buttonModifierJoueur_Click" />
    </div>
    </form>
</body>
</html>
