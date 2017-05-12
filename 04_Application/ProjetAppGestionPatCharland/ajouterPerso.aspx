<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ajouterPerso.aspx.cs" Inherits="ajouterPerso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="formAjouterPerso" runat="server">
        <div>
            <h1>Ajouter Personnage</h1>
        </div>
        <div>
        <asp:Button ID="buttonRetour"
                runat="server"
                Text="Retour"
                Width="170px" OnClick="buttonRetour_Click" />
        </div>
    </form>
</body>
</html>
