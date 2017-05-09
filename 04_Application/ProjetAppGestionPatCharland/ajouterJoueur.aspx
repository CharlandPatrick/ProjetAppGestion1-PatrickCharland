<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ajouterJoueur.aspx.cs" Inherits="ajouterJoueur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>  
        <h1>Ajouter joueur</h1>
    </div>
        <h2>Entrez le prénom du nouveau joueur:<asp:TextBox ID="TextBoxNouveauJoueur" runat="server" Width="280px" style="margin-left: 20px" Height="20px"></asp:TextBox></h2>
    <div>
    
        <asp:Button ID="buttonAjouter" runat="server" OnClick="buttonAjouter_Click" style="margin-left: 400px" Text="Ajouter" Width="287px" />
    </div>
    </form>
</body>
</html>
