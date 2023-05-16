-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ArvVor
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] string  NOT NULL ,
    [description] string  NOT NULL ,
    [goal] float  NOT NULL ,
    [pledged] float  NOT NULL ,
    [outcome] string  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] string  NOT NULL ,
    [currency] string  NOT NULL ,
    [launched_date] date  NOT NULL ,
    [end_date] date  NOT NULL ,
    [category] string  NOT NULL ,
    [subcategory] string  NOT NULL ,
    [category_id] string  NOT NULL ,
    [subcategory_id] string  NOT NULL ,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

CREATE TABLE [Contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [email] string  NOT NULL 
)

CREATE TABLE [Category] (
    [category_id] string  NOT NULL ,
    [category] string  NOT NULL ,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [SubCategory] (
    [subcategory_id] string  NOT NULL ,
    [subcategory] string  NOT NULL ,
    CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [Category] ([category_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_category_id]

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [SubCategory] ([subcategory_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_subcategory_id]

ALTER TABLE [Contacts] WITH CHECK ADD CONSTRAINT [FK_Contacts_contact_id] FOREIGN KEY([contact_id])
REFERENCES [Campaign] ([contact_id])

ALTER TABLE [Contacts] CHECK CONSTRAINT [FK_Contacts_contact_id]

COMMIT TRANSACTION QUICKDBD