CREATE TABLE ID_GENERATE
(
    ID                             CHAR(4) NOT NULL,
    NO                             DECIMAL(10,0) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE ID_GENERATE
    ADD PRIMARY KEY (ID) 
;
CREATE TABLE UGROUP_SYSTEM_ACCOUNT
(
    USER_ID                        CHAR(10) NOT NULL,
    UGROUP_ID                      CHAR(10) NOT NULL,
    EFFECTIVE_DATE_FROM            CHAR(8) NOT NULL,
    EFFECTIVE_DATE_TO              CHAR(8) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE UGROUP_SYSTEM_ACCOUNT
    ADD PRIMARY KEY (USER_ID, UGROUP_ID, EFFECTIVE_DATE_FROM) 
;
CREATE TABLE UGROUP
(
    UGROUP_ID                      CHAR(10) NOT NULL,
    UGROUP_NAME                    VARCHAR(150) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE UGROUP
    ADD PRIMARY KEY (UGROUP_ID) 
;
CREATE TABLE UGROUP_AUTHORITY
(
    UGROUP_ID                      CHAR(10) NOT NULL,
    PERMISSION_UNIT_ID             CHAR(10) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE UGROUP_AUTHORITY
    ADD PRIMARY KEY (UGROUP_ID, PERMISSION_UNIT_ID) 
;
CREATE TABLE PERMISSION_UNIT
(
    PERMISSION_UNIT_ID             CHAR(10) NOT NULL,
    PERMISSION_UNIT_NAME           VARCHAR(300) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE PERMISSION_UNIT
    ADD PRIMARY KEY (PERMISSION_UNIT_ID) 
;
CREATE TABLE PERMISSION_UNIT_REQUEST
(
    REQUEST_ID                     CHAR(10) NOT NULL,
    PERMISSION_UNIT_ID             CHAR(10) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE PERMISSION_UNIT_REQUEST
    ADD PRIMARY KEY (REQUEST_ID, PERMISSION_UNIT_ID) 
;
CREATE TABLE REQUEST
(
    REQUEST_ID                     CHAR(10) NOT NULL,
    REQUEST_NAME                   VARCHAR(300) NOT NULL,
    SERVICE_AVAILABLE              CHAR(1) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE REQUEST
    ADD PRIMARY KEY (REQUEST_ID) 
;
CREATE TABLE SYSTEM_ACCOUNT
(
    USER_ID                        CHAR(10) NOT NULL,
    LOGIN_ID                       VARCHAR(20) NOT NULL,
    PASSWORD                       VARCHAR(44) NOT NULL,
    USER_ID_LOCKED                 CHAR(1) NOT NULL,
    PASSWORD_EXPIRATION_DATE       CHAR(8) NOT NULL,
    FAILED_COUNT                   DECIMAL(1,0) NOT NULL,
    EFFECTIVE_DATE_FROM            CHAR(8) NOT NULL,
    EFFECTIVE_DATE_TO              CHAR(8) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE SYSTEM_ACCOUNT
    ADD PRIMARY KEY (USER_ID) 
;
ALTER TABLE SYSTEM_ACCOUNT
    ADD CONSTRAINT UQ_SYSTEM_ACCOUNT_LOGIN_ID UNIQUE (LOGIN_ID)
;
CREATE TABLE SYSTEM_ACCOUNT_AUTHORITY
(
    USER_ID                        CHAR(10) NOT NULL,
    PERMISSION_UNIT_ID             CHAR(10) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE SYSTEM_ACCOUNT_AUTHORITY
    ADD PRIMARY KEY (USER_ID, PERMISSION_UNIT_ID) 
;
CREATE TABLE USERS
(
    USER_ID                        CHAR(10) NOT NULL,
    KANJI_NAME                     VARCHAR(150) NOT NULL,
    KANA_NAME                      VARCHAR(150) NOT NULL,
    MAIL_ADDRESS                   VARCHAR(300) NOT NULL,
    EXTENSION_NUMBER_BUILDING      VARCHAR(2) NOT NULL,
    EXTENSION_NUMBER_PERSONAL      VARCHAR(4) NOT NULL,
    MOBILE_PHONE_NUMBER_SBSCR_CODE VARCHAR(4),
    MOBILE_PHONE_NUMBER_AREA_CODE  VARCHAR(3),
    MOBILE_PHONE_NUMBER_CITY_CODE  VARCHAR(4),
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE USERS
    ADD PRIMARY KEY (USER_ID) 
;
CREATE TABLE MESSAGE
(
    MESSAGE_ID                     CHAR(8) NOT NULL,
    LANG                           CHAR(2) NOT NULL,
    MESSAGE                        VARCHAR(600) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE MESSAGE
    ADD PRIMARY KEY (MESSAGE_ID, LANG) 
;
CREATE TABLE BUSINESS_DATE
(
    SEGMENT                        CHAR(2) NOT NULL,
    BIZ_DATE                       CHAR(8) NOT NULL,
    INSERT_USER_ID                 CHAR(10) NOT NULL,
    INSERT_DATE                    TIMESTAMP NOT NULL,
    UPDATED_USER_ID                CHAR(10) NOT NULL,
    UPDATED_DATE                   TIMESTAMP NOT NULL
)
;
ALTER TABLE BUSINESS_DATE ADD CONSTRAINT PK_BUSINESS_DATE 
    PRIMARY KEY (SEGMENT)
;


