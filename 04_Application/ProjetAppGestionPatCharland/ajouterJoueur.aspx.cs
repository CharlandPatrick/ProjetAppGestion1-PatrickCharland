using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajouterJoueur : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();
        }
    }

    protected void buttonAjouter_Click(object sender, EventArgs e)
    {
        SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();
        Joueur nouveauJoueur = new Joueur();

        nouveauJoueur.prenom = TextBoxNouveauJoueur.Text;

        ctx.Joueurs.Add(nouveauJoueur);
        ctx.SaveChanges();
        Response.Redirect("index.aspx");
    }
}