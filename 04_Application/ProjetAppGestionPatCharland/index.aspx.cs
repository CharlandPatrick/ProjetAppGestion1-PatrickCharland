using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();

            DropDownListJoueur.DataSource = ctx.Joueurs.ToList();
            DropDownListJoueur.DataTextField = "prenom";
            DropDownListJoueur.DataValueField = "Id";
            DropDownListJoueur.DataBind();
        }
    }

    protected void buttonAfficherPerso_Click(object sender, EventArgs e)
    {

    }

    protected void DropDownListJoueur_SelectedIndexChanged(object sender, EventArgs e)
    {
        int JoueurID = int.Parse(DropDownListJoueur.SelectedValue);
    
        SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();

        Joueur joueurs = (from joueur in ctx.Joueurs
                        where joueur.Id == JoueurID
                        select joueur).FirstOrDefault();

        LabelNomJoueur.Text = joueurs.prenom;
    }

    protected void buttonAjouterJoueur_Click(object sender, EventArgs e)
    {
        Response.Redirect("ajouterJoueur.aspx");
    }
}