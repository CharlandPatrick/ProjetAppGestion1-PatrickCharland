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

    }

    protected void buttonAjouter_Click(object sender, EventArgs e)
    {
        SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();
        Joueur nouveauJoueur = new Joueur();

        nouveauJoueur.prenom = TextBoxNouveauJoueur.Text;

        try
        {
            if (nouveauJoueur.prenom != "" && nouveauJoueur.prenom != " " && nouveauJoueur.prenom != null)
            {
                ctx.Joueurs.Add(nouveauJoueur);
                ctx.SaveChanges();
                Response.Redirect("index.aspx");
            }
            else
            {
                ModelState.AddModelError("", String.Format("La modification ne peut être vide"));
            }
                
        }
        catch (Exception)
        {
            ModelState.AddModelError("", String.Format("Une erreur est survenue, contactez votre administrateur système"));
        }
    }
}