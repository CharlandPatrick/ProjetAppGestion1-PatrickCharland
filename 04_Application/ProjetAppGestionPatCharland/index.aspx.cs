using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
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
            DropDownListJoueur.Items.Insert(0, "--Sélectionner un nom--");
            DropDownListJoueur.SelectedIndex = 0;
        }
    }

    protected void DropDownListJoueur_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListJoueur.Items.Remove ("--Sélectionner un nom--");
        int JoueurID = int.Parse(DropDownListJoueur.SelectedValue);
    
        SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();

        Joueur joueurs = (from joueur in ctx.Joueurs
                        where joueur.Id == JoueurID
                        select joueur).FirstOrDefault();

        LabelNomJoueur.Text = joueurs.prenom;

        
        var query = from perso in ctx.Personnages where perso.Joueur.Id == JoueurID
                    select new
                    {
                        perso.Id,
                        perso.prenom,
                        perso.nom,
                        perso.nomDeCode,
                        perso.niveau,
                    };

        GridViewPersonnage.DataSource = query.ToList();
        GridViewPersonnage.DataBind();

        DropDownListPerso.DataSource = GridViewPersonnage.DataSource;
        DropDownListPerso.DataTextField = "prenom";
        DropDownListPerso.DataValueField = "Id";
        DropDownListPerso.DataBind();
    }

    protected void buttonAjouterJoueur_Click(object sender, EventArgs e)
    {
        Response.Redirect("ajouterJoueur.aspx");
    }

    protected void buttonSupprimerJoueur_Click(object sender, EventArgs e)
    {
        int JoueurID = int.Parse(DropDownListJoueur.SelectedValue);

        using (SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer())
        {
            Joueur joueur = null;
            joueur = ctx.Joueurs.Find(JoueurID);
            if (joueur == null)
            {
                ModelState.AddModelError("", String.Format("Ce joueur n'existe pas"));
            }
            else
            {
                try
                {
                    ctx.Joueurs.Remove(joueur);
                    ctx.SaveChanges();
                    Response.Redirect("index.aspx");
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", String.Format("Ce joueur a déjà été retiré de la base de données."));
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", String.Format("Une erreur est survenue, contactez votre administrateur système"));
                }
            }
        }
    }

    protected void buttonModifierJoueur0_Click(object sender, EventArgs e)
    {
        Response.Redirect("modifierJoueur.aspx");
    }

    protected void buttonSupprimerPerso_Click(object sender, EventArgs e)
    {
        int PersoID = int.Parse(DropDownListPerso.SelectedValue);

        using (SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer())
        {
            Personnage perso = null;
            perso = ctx.Personnages.Find(PersoID);
            if (perso == null)
            {
                ModelState.AddModelError("", String.Format("Ce personnage n'existe pas"));
            }
            else
            {
                try
                {
                    ctx.Personnages.Remove(perso);
                    ctx.SaveChanges();
                    Response.Redirect("index.aspx");
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", String.Format("Ce personnage a déjà été retiré de la base de données."));
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", String.Format("Une erreur est survenue, contactez votre administrateur système"));
                }
            }
        }
    }

    protected void buttonAjouterPerso_Click(object sender, EventArgs e)
    {
        Response.Redirect("ajouterPerso.aspx");
    }

    protected void buttonModifierPerso_Click(object sender, EventArgs e)
    {
        Response.Redirect("modifierPerso.aspx");
    }
}