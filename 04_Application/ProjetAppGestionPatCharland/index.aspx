<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sigma Protocol</title>
</head>
<body>
    <form id="formJoueur" runat="server">
    <div>  
        <h1>Joueurs</h1>
    </div>
    <div>
        <h2>Nom:<asp:DropDownList ID="DropDownListJoueur" runat="server" Height="30px" style="margin-left: 21px" Width="280px" OnSelectedIndexChanged="DropDownListJoueur_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
        </h2>
    </div>
    <div>
        <asp:Button ID="buttonAjouterJoueur" runat="server" Text="Ajouter Joueur" Width="170px" style="margin-left: 0px" OnClick="buttonAjouterJoueur_Click" />
        <asp:Button ID="buttonSupprimerJoueur" runat="server" Text="Supprimer Joueur" Width="170px" style="margin-left: 20px" OnClick="buttonAjouterJoueur_Click" />
    </div>
    <div>
        <h3>Personnages de <asp:Label ID="LabelNomJoueur" runat="server" Text="***"></asp:Label>:</h3>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>

    </form>
</body>
</html>
