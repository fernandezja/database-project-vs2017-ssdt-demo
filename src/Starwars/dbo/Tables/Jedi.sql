CREATE TABLE [dbo].[Jedi] (
    [JediId]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (100) NOT NULL,
    [DateBirth] DATE          NULL,
    CONSTRAINT [PK_Jedi] PRIMARY KEY CLUSTERED ([JediId] ASC)
);



