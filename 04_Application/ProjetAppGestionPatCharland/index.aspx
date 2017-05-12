<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sigma Protocol</title>
</head>
<body>
    <form id="formJoueur" runat="server">
        <div>
            <h1>Joueurs</h1>
        </div>
        <div>
            <h2>Nom:<asp:DropDownList ID="DropDownListJoueur"
                runat="server"
                Height="30px"
                Style="margin-left: 20px"
                Width="280px"
                OnSelectedIndexChanged="DropDownListJoueur_SelectedIndexChanged"
                AutoPostBack="True">
            </asp:DropDownList>
            </h2>
        </div>
        <div>
            <asp:Button ID="buttonAjouterJoueur"
                runat="server"
                Text="Ajouter Joueur"
                Width="170px"
                Style="margin-left: 0px"
                OnClick="buttonAjouterJoueur_Click" />
            <asp:Button ID="buttonSupprimerJoueur"
                runat="server"
                Text="Supprimer Joueur"
                Width="170px"
                Style="margin-left: 20px"
                OnClick="buttonSupprimerJoueur_Click" />
            <asp:Button ID="buttonModifierJoueur0"
                runat="server"
                Text="Modifier Joueur"
                Width="170px"
                Style="margin-left: 20px"
                OnClick="buttonModifierJoueur0_Click" />
        </div>
        <div>
            <h3>Personnages de
                <asp:Label ID="LabelNomJoueur"
                    runat="server"
                    Text="***">
                </asp:Label>:</h3>
        </div>
        <div>
            <asp:GridView ID="GridViewPersonnage"
                AutoGenerateColumns="False"
                runat="server" 
                Width="552px">
                <Columns>
                    <asp:BoundField DataField="prenom" HeaderText="Prénom" />
                    <asp:BoundField DataField="nom" HeaderText="Nom" />
                    <asp:BoundField DataField="nomDeCode" HeaderText="Nom de code" />
                    <asp:BoundField DataField="niveau" HeaderText="Niveau" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div>
            <asp:DropDownList ID="DropDownListPerso"
                runat="server"
                Height="30px"
                Style="margin-right: 20px"
                Width="350px"
                AutoPostBack="True">
            </asp:DropDownList>
        </div>
        <br />
        <div>
            <asp:Button ID="buttonAjouterPerso"
                runat="server"
                Text="Ajouter Personnage"
                Width="170px"
                Style="margin-left: 0px" OnClick="buttonAjouterPerso_Click" />
            <asp:Button ID="buttonSupprimerPerso"
                runat="server"
                Text="Supprimer Personnage"
                Width="170px"
                Style="margin-left: 20px" OnClick="buttonSupprimerPerso_Click" />
            <asp:Button ID="buttonModifierPerso"
                runat="server"
                Text="Voir / Modifier Personnage"
                Width="170px"
                Style="margin-left: 20px" OnClick="buttonModifierPerso_Click" />
        </div>
    </form>
</body>
</html>
