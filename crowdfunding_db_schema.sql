-- To Use only if the tables need to be dropped. 
-- Note that if you drop the tables, you need to import them again
-- DROP TABLE IF EXISTS campaign;
-- DROP TABLE IF EXISTS category;
-- DROP TABLE IF EXISTS contacts;
-- DROP TABLE IF EXISTS subcategory;

--------------------------------------------------------------
--           	  CROWDFUNDING_ETL SCHEMA 		   			--
--------------------------------------------------------------
-- Run this section all until after dropping the constraints
-- The VARCHAR values that do not have a character limit is due to
-- avoid errors when importing the .csv files.

CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR   NOT NULL,
    "curency" VARCHAR   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR  NOT NULL,
    "subcategory_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" VARCHAR(20)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "email" VARCHAR   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(20)   NOT NULL,
    "subcategory" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- In order to upload the CSV files to their respective tables
-- Drop all constraints in the specified order
-- Drop foreign key constraints first, then primary key constraints

-- Drop foreign key constraints
ALTER TABLE "campaign" DROP CONSTRAINT IF EXISTS "fk_campaign_contact_id";
ALTER TABLE "campaign" DROP CONSTRAINT IF EXISTS "fk_campaign_category_id";
ALTER TABLE "campaign" DROP CONSTRAINT IF EXISTS "fk_campaign_subcategory_id";


-- Drop primary key constraints
ALTER TABLE "campaign" DROP CONSTRAINT IF EXISTS "pk_campaign";
ALTER TABLE "category" DROP CONSTRAINT IF EXISTS "pk_category";
ALTER TABLE "contacts" DROP CONSTRAINT IF EXISTS "pk_contacts";
ALTER TABLE "subcategory" DROP CONSTRAINT IF EXISTS "pk_subcategory";

-- Run the code up to here to create the tables.
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- Now import the CSV files accordingly with the header option checked for each 
-- table created.
---------------------------------------------------------------------------------
-- Verify that all the tables display accordingly. Run each query at the time.

SELECT * FROM campaign
SELECT * FROM category
SELECT * FROM contacts
SELECT * FROM subcategory

------------------------------------------------------------------------------
-- Add all the constraints(again) that were dropped after importing the CSVs
-- and after values displayed correctly. Run all the next section.
------------------------------------------------------------------------------
-- Re-add all constraints in the specified order
-- Re-add primary key constraints first, then foreign key constraints

-- Re-add primary key constraints
ALTER TABLE "campaign" ADD CONSTRAINT "pk_campaign" PRIMARY KEY ("cf_id");
ALTER TABLE "category" ADD CONSTRAINT "pk_category" PRIMARY KEY ("category_id");
ALTER TABLE "contacts" ADD CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_id");
ALTER TABLE "subcategory" ADD CONSTRAINT "pk_subcategory" PRIMARY KEY ("subcategory_id");

-- Re-add foreign key constraints
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("contact_id");
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY ("category_id") REFERENCES "category" ("category_id");
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY ("subcategory_id") REFERENCES "subcategory" ("subcategory_id");

----------------------------------------------------------------------------------------------------------------
--			 			      Now the tables should be available for queries					  		      --
----------------------------------------------------------------------------------------------------------------
-- NOTE: This schema was originally created from exporting the ERD via https://app.quickdatabasediagrams.com/
-- and was edited in order to be able to import the .csv files into their respective tables without errors
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

