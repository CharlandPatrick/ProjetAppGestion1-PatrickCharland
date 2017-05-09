
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2017 13:37:00
-- Generated from EDMX file: C:\Users\blupp\Google Drive Cégep\Applications de gestion\ProjetAppGestion1-PatrickCharland\04_Application\ProjetAppGestionPatCharland\App_Code\SigmaCreationPerso.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SigmaProtocolBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Joueurs'
CREATE TABLE [dbo].[Joueurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [prenom] nchar(32)  NOT NULL
);
GO

-- Creating table 'Personnages'
CREATE TABLE [dbo].[Personnages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [prenom] nchar(32)  NOT NULL,
    [nom] nchar(32)  NOT NULL,
    [nomDeCode] nchar(16)  NOT NULL,
    [niveau] int  NOT NULL,
    [descriptionPhsique] nvarchar(max)  NOT NULL,
    [biographie] nvarchar(max)  NOT NULL,
    [SpecialitesSecondaire_Id] int  NOT NULL,
    [UnitesSpeciales_Id] int  NOT NULL,
    [ClassesSoldat_Id] int  NOT NULL,
    [SpecialitesPrimaire_Id] int  NOT NULL,
    [Joueur_Id] int  NOT NULL,
    [Attribut_Id] int  NOT NULL
);
GO

-- Creating table 'Attributs'
CREATE TABLE [dbo].[Attributs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nchar(32)  NOT NULL,
    [combat] int  NOT NULL,
    [tir] int  NOT NULL,
    [eveil] int  NOT NULL,
    [furtivite] int  NOT NULL,
    [resistence] int  NOT NULL,
    [leadership] int  NOT NULL,
    [formePhysique] int  NOT NULL,
    [capaciteTechnique] int  NOT NULL
);
GO

-- Creating table 'EquipementEmportes'
CREATE TABLE [dbo].[EquipementEmportes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL,
    [entraine] bit  NOT NULL,
    [Personnage_Id] int  NOT NULL,
    [Equipement_Id] int  NOT NULL
);
GO

-- Creating table 'Equipements'
CREATE TABLE [dbo].[Equipements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL,
    [nonEntraine] nchar(128)  NOT NULL,
    [entraine] nchar(128)  NOT NULL,
    [EquipementType_Id] int  NOT NULL
);
GO

-- Creating table 'EquipementTypes'
CREATE TABLE [dbo].[EquipementTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Armures_Id] int  NOT NULL
);
GO

-- Creating table 'EquipementSpecialites'
CREATE TABLE [dbo].[EquipementSpecialites] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SpecialitesSecondaire_Id] int  NOT NULL,
    [Equipements_Id] int  NOT NULL
);
GO

-- Creating table 'SpecialitesSecondaires'
CREATE TABLE [dbo].[SpecialitesSecondaires] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL
);
GO

-- Creating table 'UnitesSpeciales'
CREATE TABLE [dbo].[UnitesSpeciales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL
);
GO

-- Creating table 'Armures'
CREATE TABLE [dbo].[Armures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [modele] nchar(32)  NOT NULL,
    [bonus] int  NOT NULL,
    [absortion] int  NOT NULL,
    [vitesse] int  NOT NULL
);
GO

-- Creating table 'UnitesSpecialesLangages'
CREATE TABLE [dbo].[UnitesSpecialesLangages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UnitesSpeciale_Id] int  NOT NULL,
    [Langage_Id] int  NOT NULL
);
GO

-- Creating table 'Langages'
CREATE TABLE [dbo].[Langages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(16)  NOT NULL
);
GO

-- Creating table 'ArmesEmportees'
CREATE TABLE [dbo].[ArmesEmportees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Personnage_Id] int  NOT NULL,
    [Arme_Id] int  NOT NULL
);
GO

-- Creating table 'Armes'
CREATE TABLE [dbo].[Armes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(max)  NOT NULL,
    [distanceCourte] nvarchar(max)  NOT NULL,
    [distanceLongue] nvarchar(max)  NOT NULL,
    [dommage] nvarchar(max)  NOT NULL,
    [teteAtteinte] nvarchar(max)  NOT NULL,
    [UnitesSpeciale_Id] int  NOT NULL,
    [ArmesType_Id] int  NOT NULL
);
GO

-- Creating table 'ArmesMotsCles'
CREATE TABLE [dbo].[ArmesMotsCles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Arme_Id] int  NOT NULL,
    [MotsCle_Id] int  NOT NULL
);
GO

-- Creating table 'MotsCles'
CREATE TABLE [dbo].[MotsCles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(16)  NOT NULL,
    [effet] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ArmesTypes'
CREATE TABLE [dbo].[ArmesTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(16)  NOT NULL
);
GO

-- Creating table 'ClassesSoldats'
CREATE TABLE [dbo].[ClassesSoldats] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(16)  NOT NULL,
    [bonus] nchar(128)  NOT NULL
);
GO

-- Creating table 'ClassesArmesTypes'
CREATE TABLE [dbo].[ClassesArmesTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClassesSoldat_Id] int  NOT NULL,
    [ArmesType_Id] int  NOT NULL
);
GO

-- Creating table 'SpecialitesPrimaires'
CREATE TABLE [dbo].[SpecialitesPrimaires] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL,
    [ManoeuvresTactique_Id] int  NOT NULL
);
GO

-- Creating table 'SpecialitesPrmairesBonus'
CREATE TABLE [dbo].[SpecialitesPrmairesBonus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SpecialitesPrimaire_Id] int  NOT NULL,
    [BonusAttribut_Id] int  NOT NULL
);
GO

-- Creating table 'ManoeuvresTactiques'
CREATE TABLE [dbo].[ManoeuvresTactiques] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nom] nchar(32)  NOT NULL,
    [description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BonusAttributs'
CREATE TABLE [dbo].[BonusAttributs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [bonusAttribut] nvarchar(max)  NOT NULL,
    [valeur] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Joueurs'
ALTER TABLE [dbo].[Joueurs]
ADD CONSTRAINT [PK_Joueurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [PK_Personnages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Attributs'
ALTER TABLE [dbo].[Attributs]
ADD CONSTRAINT [PK_Attributs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipementEmportes'
ALTER TABLE [dbo].[EquipementEmportes]
ADD CONSTRAINT [PK_EquipementEmportes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Equipements'
ALTER TABLE [dbo].[Equipements]
ADD CONSTRAINT [PK_Equipements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipementTypes'
ALTER TABLE [dbo].[EquipementTypes]
ADD CONSTRAINT [PK_EquipementTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipementSpecialites'
ALTER TABLE [dbo].[EquipementSpecialites]
ADD CONSTRAINT [PK_EquipementSpecialites]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SpecialitesSecondaires'
ALTER TABLE [dbo].[SpecialitesSecondaires]
ADD CONSTRAINT [PK_SpecialitesSecondaires]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UnitesSpeciales'
ALTER TABLE [dbo].[UnitesSpeciales]
ADD CONSTRAINT [PK_UnitesSpeciales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Armures'
ALTER TABLE [dbo].[Armures]
ADD CONSTRAINT [PK_Armures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UnitesSpecialesLangages'
ALTER TABLE [dbo].[UnitesSpecialesLangages]
ADD CONSTRAINT [PK_UnitesSpecialesLangages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Langages'
ALTER TABLE [dbo].[Langages]
ADD CONSTRAINT [PK_Langages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArmesEmportees'
ALTER TABLE [dbo].[ArmesEmportees]
ADD CONSTRAINT [PK_ArmesEmportees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Armes'
ALTER TABLE [dbo].[Armes]
ADD CONSTRAINT [PK_Armes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArmesMotsCles'
ALTER TABLE [dbo].[ArmesMotsCles]
ADD CONSTRAINT [PK_ArmesMotsCles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MotsCles'
ALTER TABLE [dbo].[MotsCles]
ADD CONSTRAINT [PK_MotsCles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArmesTypes'
ALTER TABLE [dbo].[ArmesTypes]
ADD CONSTRAINT [PK_ArmesTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassesSoldats'
ALTER TABLE [dbo].[ClassesSoldats]
ADD CONSTRAINT [PK_ClassesSoldats]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassesArmesTypes'
ALTER TABLE [dbo].[ClassesArmesTypes]
ADD CONSTRAINT [PK_ClassesArmesTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SpecialitesPrimaires'
ALTER TABLE [dbo].[SpecialitesPrimaires]
ADD CONSTRAINT [PK_SpecialitesPrimaires]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SpecialitesPrmairesBonus'
ALTER TABLE [dbo].[SpecialitesPrmairesBonus]
ADD CONSTRAINT [PK_SpecialitesPrmairesBonus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ManoeuvresTactiques'
ALTER TABLE [dbo].[ManoeuvresTactiques]
ADD CONSTRAINT [PK_ManoeuvresTactiques]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BonusAttributs'
ALTER TABLE [dbo].[BonusAttributs]
ADD CONSTRAINT [PK_BonusAttributs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Personnage_Id] in table 'EquipementEmportes'
ALTER TABLE [dbo].[EquipementEmportes]
ADD CONSTRAINT [FK_EquipementEmportePersonnage]
    FOREIGN KEY ([Personnage_Id])
    REFERENCES [dbo].[Personnages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipementEmportePersonnage'
CREATE INDEX [IX_FK_EquipementEmportePersonnage]
ON [dbo].[EquipementEmportes]
    ([Personnage_Id]);
GO

-- Creating foreign key on [Equipement_Id] in table 'EquipementEmportes'
ALTER TABLE [dbo].[EquipementEmportes]
ADD CONSTRAINT [FK_EquipementEmporteEquipement]
    FOREIGN KEY ([Equipement_Id])
    REFERENCES [dbo].[Equipements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipementEmporteEquipement'
CREATE INDEX [IX_FK_EquipementEmporteEquipement]
ON [dbo].[EquipementEmportes]
    ([Equipement_Id]);
GO

-- Creating foreign key on [EquipementType_Id] in table 'Equipements'
ALTER TABLE [dbo].[Equipements]
ADD CONSTRAINT [FK_EquipementEquipementType]
    FOREIGN KEY ([EquipementType_Id])
    REFERENCES [dbo].[EquipementTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipementEquipementType'
CREATE INDEX [IX_FK_EquipementEquipementType]
ON [dbo].[Equipements]
    ([EquipementType_Id]);
GO

-- Creating foreign key on [Armures_Id] in table 'EquipementTypes'
ALTER TABLE [dbo].[EquipementTypes]
ADD CONSTRAINT [FK_EquipementTypeArmure]
    FOREIGN KEY ([Armures_Id])
    REFERENCES [dbo].[Armures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipementTypeArmure'
CREATE INDEX [IX_FK_EquipementTypeArmure]
ON [dbo].[EquipementTypes]
    ([Armures_Id]);
GO

-- Creating foreign key on [SpecialitesSecondaire_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_SpecialitesSecondairePersonnage]
    FOREIGN KEY ([SpecialitesSecondaire_Id])
    REFERENCES [dbo].[SpecialitesSecondaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialitesSecondairePersonnage'
CREATE INDEX [IX_FK_SpecialitesSecondairePersonnage]
ON [dbo].[Personnages]
    ([SpecialitesSecondaire_Id]);
GO

-- Creating foreign key on [SpecialitesSecondaire_Id] in table 'EquipementSpecialites'
ALTER TABLE [dbo].[EquipementSpecialites]
ADD CONSTRAINT [FK_SpecialitesSecondaireEquipementSpecialite]
    FOREIGN KEY ([SpecialitesSecondaire_Id])
    REFERENCES [dbo].[SpecialitesSecondaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialitesSecondaireEquipementSpecialite'
CREATE INDEX [IX_FK_SpecialitesSecondaireEquipementSpecialite]
ON [dbo].[EquipementSpecialites]
    ([SpecialitesSecondaire_Id]);
GO

-- Creating foreign key on [Equipements_Id] in table 'EquipementSpecialites'
ALTER TABLE [dbo].[EquipementSpecialites]
ADD CONSTRAINT [FK_EquipementSpecialiteEquipement]
    FOREIGN KEY ([Equipements_Id])
    REFERENCES [dbo].[Equipements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipementSpecialiteEquipement'
CREATE INDEX [IX_FK_EquipementSpecialiteEquipement]
ON [dbo].[EquipementSpecialites]
    ([Equipements_Id]);
GO

-- Creating foreign key on [UnitesSpeciales_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_PersonnageUnitesSpeciale]
    FOREIGN KEY ([UnitesSpeciales_Id])
    REFERENCES [dbo].[UnitesSpeciales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonnageUnitesSpeciale'
CREATE INDEX [IX_FK_PersonnageUnitesSpeciale]
ON [dbo].[Personnages]
    ([UnitesSpeciales_Id]);
GO

-- Creating foreign key on [UnitesSpeciale_Id] in table 'UnitesSpecialesLangages'
ALTER TABLE [dbo].[UnitesSpecialesLangages]
ADD CONSTRAINT [FK_UnitesSpecialeUnitesSpecialesLangage]
    FOREIGN KEY ([UnitesSpeciale_Id])
    REFERENCES [dbo].[UnitesSpeciales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitesSpecialeUnitesSpecialesLangage'
CREATE INDEX [IX_FK_UnitesSpecialeUnitesSpecialesLangage]
ON [dbo].[UnitesSpecialesLangages]
    ([UnitesSpeciale_Id]);
GO

-- Creating foreign key on [Langage_Id] in table 'UnitesSpecialesLangages'
ALTER TABLE [dbo].[UnitesSpecialesLangages]
ADD CONSTRAINT [FK_LangageUnitesSpecialesLangage]
    FOREIGN KEY ([Langage_Id])
    REFERENCES [dbo].[Langages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LangageUnitesSpecialesLangage'
CREATE INDEX [IX_FK_LangageUnitesSpecialesLangage]
ON [dbo].[UnitesSpecialesLangages]
    ([Langage_Id]);
GO

-- Creating foreign key on [Personnage_Id] in table 'ArmesEmportees'
ALTER TABLE [dbo].[ArmesEmportees]
ADD CONSTRAINT [FK_PersonnageArmesEmportee]
    FOREIGN KEY ([Personnage_Id])
    REFERENCES [dbo].[Personnages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonnageArmesEmportee'
CREATE INDEX [IX_FK_PersonnageArmesEmportee]
ON [dbo].[ArmesEmportees]
    ([Personnage_Id]);
GO

-- Creating foreign key on [Arme_Id] in table 'ArmesEmportees'
ALTER TABLE [dbo].[ArmesEmportees]
ADD CONSTRAINT [FK_ArmeArmesEmportee]
    FOREIGN KEY ([Arme_Id])
    REFERENCES [dbo].[Armes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArmeArmesEmportee'
CREATE INDEX [IX_FK_ArmeArmesEmportee]
ON [dbo].[ArmesEmportees]
    ([Arme_Id]);
GO

-- Creating foreign key on [UnitesSpeciale_Id] in table 'Armes'
ALTER TABLE [dbo].[Armes]
ADD CONSTRAINT [FK_UnitesSpecialeArme]
    FOREIGN KEY ([UnitesSpeciale_Id])
    REFERENCES [dbo].[UnitesSpeciales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitesSpecialeArme'
CREATE INDEX [IX_FK_UnitesSpecialeArme]
ON [dbo].[Armes]
    ([UnitesSpeciale_Id]);
GO

-- Creating foreign key on [Arme_Id] in table 'ArmesMotsCles'
ALTER TABLE [dbo].[ArmesMotsCles]
ADD CONSTRAINT [FK_ArmeArmesMotsCle]
    FOREIGN KEY ([Arme_Id])
    REFERENCES [dbo].[Armes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArmeArmesMotsCle'
CREATE INDEX [IX_FK_ArmeArmesMotsCle]
ON [dbo].[ArmesMotsCles]
    ([Arme_Id]);
GO

-- Creating foreign key on [ArmesType_Id] in table 'Armes'
ALTER TABLE [dbo].[Armes]
ADD CONSTRAINT [FK_ArmesTypeArme]
    FOREIGN KEY ([ArmesType_Id])
    REFERENCES [dbo].[ArmesTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArmesTypeArme'
CREATE INDEX [IX_FK_ArmesTypeArme]
ON [dbo].[Armes]
    ([ArmesType_Id]);
GO

-- Creating foreign key on [MotsCle_Id] in table 'ArmesMotsCles'
ALTER TABLE [dbo].[ArmesMotsCles]
ADD CONSTRAINT [FK_MotsCleArmesMotsCle]
    FOREIGN KEY ([MotsCle_Id])
    REFERENCES [dbo].[MotsCles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MotsCleArmesMotsCle'
CREATE INDEX [IX_FK_MotsCleArmesMotsCle]
ON [dbo].[ArmesMotsCles]
    ([MotsCle_Id]);
GO

-- Creating foreign key on [ClassesSoldat_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_ClassesSoldatPersonnage]
    FOREIGN KEY ([ClassesSoldat_Id])
    REFERENCES [dbo].[ClassesSoldats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassesSoldatPersonnage'
CREATE INDEX [IX_FK_ClassesSoldatPersonnage]
ON [dbo].[Personnages]
    ([ClassesSoldat_Id]);
GO

-- Creating foreign key on [ClassesSoldat_Id] in table 'ClassesArmesTypes'
ALTER TABLE [dbo].[ClassesArmesTypes]
ADD CONSTRAINT [FK_ClassesSoldatClassesArmesType]
    FOREIGN KEY ([ClassesSoldat_Id])
    REFERENCES [dbo].[ClassesSoldats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassesSoldatClassesArmesType'
CREATE INDEX [IX_FK_ClassesSoldatClassesArmesType]
ON [dbo].[ClassesArmesTypes]
    ([ClassesSoldat_Id]);
GO

-- Creating foreign key on [ArmesType_Id] in table 'ClassesArmesTypes'
ALTER TABLE [dbo].[ClassesArmesTypes]
ADD CONSTRAINT [FK_ArmesTypeClassesArmesType]
    FOREIGN KEY ([ArmesType_Id])
    REFERENCES [dbo].[ArmesTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArmesTypeClassesArmesType'
CREATE INDEX [IX_FK_ArmesTypeClassesArmesType]
ON [dbo].[ClassesArmesTypes]
    ([ArmesType_Id]);
GO

-- Creating foreign key on [SpecialitesPrimaire_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_SpecialitesPrimairePersonnage]
    FOREIGN KEY ([SpecialitesPrimaire_Id])
    REFERENCES [dbo].[SpecialitesPrimaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialitesPrimairePersonnage'
CREATE INDEX [IX_FK_SpecialitesPrimairePersonnage]
ON [dbo].[Personnages]
    ([SpecialitesPrimaire_Id]);
GO

-- Creating foreign key on [SpecialitesPrimaire_Id] in table 'SpecialitesPrmairesBonus'
ALTER TABLE [dbo].[SpecialitesPrmairesBonus]
ADD CONSTRAINT [FK_SpecialitesPrimaireSpecialitesPrmairesBonus]
    FOREIGN KEY ([SpecialitesPrimaire_Id])
    REFERENCES [dbo].[SpecialitesPrimaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialitesPrimaireSpecialitesPrmairesBonus'
CREATE INDEX [IX_FK_SpecialitesPrimaireSpecialitesPrmairesBonus]
ON [dbo].[SpecialitesPrmairesBonus]
    ([SpecialitesPrimaire_Id]);
GO

-- Creating foreign key on [ManoeuvresTactique_Id] in table 'SpecialitesPrimaires'
ALTER TABLE [dbo].[SpecialitesPrimaires]
ADD CONSTRAINT [FK_ManoeuvresTactiqueSpecialitesPrimaire]
    FOREIGN KEY ([ManoeuvresTactique_Id])
    REFERENCES [dbo].[ManoeuvresTactiques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ManoeuvresTactiqueSpecialitesPrimaire'
CREATE INDEX [IX_FK_ManoeuvresTactiqueSpecialitesPrimaire]
ON [dbo].[SpecialitesPrimaires]
    ([ManoeuvresTactique_Id]);
GO

-- Creating foreign key on [BonusAttribut_Id] in table 'SpecialitesPrmairesBonus'
ALTER TABLE [dbo].[SpecialitesPrmairesBonus]
ADD CONSTRAINT [FK_BonusAttributSpecialitesPrmairesBonus]
    FOREIGN KEY ([BonusAttribut_Id])
    REFERENCES [dbo].[BonusAttributs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BonusAttributSpecialitesPrmairesBonus'
CREATE INDEX [IX_FK_BonusAttributSpecialitesPrmairesBonus]
ON [dbo].[SpecialitesPrmairesBonus]
    ([BonusAttribut_Id]);
GO

-- Creating foreign key on [Joueur_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_JoueurPersonnage]
    FOREIGN KEY ([Joueur_Id])
    REFERENCES [dbo].[Joueurs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JoueurPersonnage'
CREATE INDEX [IX_FK_JoueurPersonnage]
ON [dbo].[Personnages]
    ([Joueur_Id]);
GO

-- Creating foreign key on [Attribut_Id] in table 'Personnages'
ALTER TABLE [dbo].[Personnages]
ADD CONSTRAINT [FK_AttributPersonnage]
    FOREIGN KEY ([Attribut_Id])
    REFERENCES [dbo].[Attributs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AttributPersonnage'
CREATE INDEX [IX_FK_AttributPersonnage]
ON [dbo].[Personnages]
    ([Attribut_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------