using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modifierJoueur : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SigmaCreationPersoContainer ctx = new SigmaCreationPersoContainer();

            DropDownListModifier.DataSource = ctx.Joueurs.ToList();
            DropDownListModifier.DataTextField = "prenom";
            DropDownListModifier.DataValueField = "Id";
            DropDownListModifier.DataBind();
            DropDownListModifier.Items.Insert(0, "--Sélectionner un nom--");
            DropDownListModifier.SelectedIndex = 0;
        }
    }

    protected void buttonModifierJoueur_Click(object sender, EventArgs e)
    {
        int JoueurID = int.Parse(DropDownListModifier.SelectedValue);

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
                    joueur.prenom = TextBoxModifier.Text;
                    if (joueur.prenom != "" && joueur.prenom != " " && joueur.prenom != null)
                    {
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
    }

    protected void DropDownListModifier_SelectedIndexChanged(object sender, EventArgs e)
    {
        buttonModifierJoueur.Enabled = true;
    }
}