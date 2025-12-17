-- PostgreSQL Script converted from MySQL Script from MySQL Workbench EER Model
-- Target Database: PostgreSQL 16+

-- 1. Disable constraints/checks for setup
SET session_replication_role = 'replica';

-- 2. Schema and Database Setup

CREATE SCHEMA IF NOT EXISTS card_value_db;

-- Set the search path to the new schema
SET search_path TO card_value_db, public;

-- -----------------------------------------------------
-- Table Dim_User
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_User (
  -- MySQL AUTO_INCREMENT becomes SERIAL in PostgreSQL
  user_id SERIAL NOT NULL,
  current_age INTEGER NULL,
  retirement_age INTEGER NULL,
  -- YEAR(4) is not standard; replaced with SMALLINT for birth year
  birth_year SMALLINT NULL,
  birth_month SMALLINT NULL,
  gender VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  latitude DECIMAL(11, 8) NULL,
  longitude DECIMAL(11, 8) NULL,
  per_capita_income DECIMAL(15, 2) NULL,
  yearly_income DECIMAL(15, 2) NULL,
  total_debt DECIMAL(15, 2) NULL,
  credit_score INTEGER NULL,
  num_credit_cards INTEGER NULL,
  PRIMARY KEY (user_id)
);

-- -----------------------------------------------------
-- Table Dim_Card
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Card (
  Dim_Card_id SERIAL NOT NULL, --PK
  Dim_User_user_id INTEGER NOT NULL, -- FK
  card_brand VARCHAR(45) NULL,
  card_type VARCHAR(45) NULL,
  card_number VARCHAR(20) NULL,
  expires DATE NULL,
  cvv SMALLINT NULL,
  has_chip BOOLEAN NULL,
  num_cards_issued SMALLINT NULL,
  credit_limit DECIMAL(15, 2) NULL,
  acct_open_date TIMESTAMP WITHOUT TIME ZONE NULL, -- DATETIME becomes TIMESTAMP
  year_pin_last_changed SMALLINT NULL,
  card_on_dark_web BOOLEAN NULL, -- TINYINT becomes BOOLEAN

  -- Composite Primary Key
  PRIMARY KEY (Dim_Card_id, Dim_User_user_id),

  -- Foreign Key Constraint Definition
  CONSTRAINT fk_Dim_Card_Dim_User
    FOREIGN KEY (Dim_User_user_id)
    REFERENCES Dim_User (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table Fact_Transactions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fact_Transactions (
  id SERIAL NOT NULL, --PK
  Dim_Card_Dim_Card_id INTEGER NOT NULL, --FK
  Dim_Card_Dim_User_user_id INTEGER NOT NULL, --FK
  date TIMESTAMP WITHOUT TIME ZONE NULL, -- DATETIME becomes TIMESTAMP
  amount DECIMAL(15, 2) NOT NULL, -- DECIMAL(2) changed to a more realistic size
  use_chip VARCHAR(45) NULL,
  merchant_id INTEGER NULL,
  merchant_city VARCHAR(45) NULL,
  merchant_state VARCHAR(45) NULL,
  zip INTEGER NULL,
  mcc SMALLINT NULL, -- INT(4) non-standard; changed to SMALLINT
  errors VARCHAR(45) NULL,

  -- Composite Primary Key
  PRIMARY KEY (id, Dim_Card_Dim_Card_id, Dim_Card_Dim_User_user_id),

  -- Foreign Key Constraint Definition
  CONSTRAINT fk_Fact_Transactions_Dim_Card1
    FOREIGN KEY (Dim_Card_Dim_Card_id, Dim_Card_Dim_User_user_id)
    REFERENCES Dim_Card (Dim_Card_id, Dim_User_user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- 3. Enable constraints/checks for execution (Optional)
SET session_replication_role = 'origin';
