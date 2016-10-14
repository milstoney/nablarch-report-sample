-- ユーザグループ全件検索（表示）
SELECT_ALL_UGROUPS=
SELECT
    UGROUP_ID,
    UGROUP_NAME
FROM
    UGROUP
ORDER BY
    UGROUP_ID


-- 認可単位検索
CHECK_PERMISSION_UNIT=
SELECT
    PERMISSION_UNIT_NAME
FROM
    PERMISSION_UNIT
WHERE
    PERMISSION_UNIT_ID = ?


-- ユーザグループ検索
CHECK_UGROUP=
SELECT
    UGROUP_NAME
FROM
    UGROUP
WHERE
    UGROUP_ID = ?


-- 認可単位全件検索
SELECT_ALL_PERMISSION_UNITS=
SELECT
    PERMISSION_UNIT_ID,
    PERMISSION_UNIT_NAME
FROM
    PERMISSION_UNIT
ORDER BY
    PERMISSION_UNIT_ID

    
-- 対象ユーザ基本情報取得SQL
SELECT_USER_BASIC_INFO=
SELECT
    USERS.USER_ID,
    USERS.KANJI_NAME,
    USERS.KANA_NAME,
    USERS.MAIL_ADDRESS,
    USERS.EXTENSION_NUMBER_BUILDING,
    USERS.EXTENSION_NUMBER_PERSONAL,
    USERS.MOBILE_PHONE_NUMBER_SBSCR_CODE,
    USERS.MOBILE_PHONE_NUMBER_AREA_CODE,
    USERS.MOBILE_PHONE_NUMBER_CITY_CODE,
    SA.LOGIN_ID,
    SA.EFFECTIVE_DATE_FROM,
    SA.EFFECTIVE_DATE_TO
FROM
    USERS USERS
INNER JOIN
    SYSTEM_ACCOUNT SA
ON 
    USERS.USER_ID = SA.USER_ID
WHERE
    USERS.USER_ID = ?
    
-- 対象ユーザの有する認可単位情報取得時に用いるSQL
SELECT_PERMISSION_UNIT=
SELECT
    PU.PERMISSION_UNIT_ID,
    PU.PERMISSION_UNIT_NAME
FROM
    PERMISSION_UNIT PU
INNER JOIN
    SYSTEM_ACCOUNT_AUTHORITY SAA
ON
    PU.PERMISSION_UNIT_ID = SAA.PERMISSION_UNIT_ID
WHERE
    SAA.USER_ID = ?
ORDER BY PU.PERMISSION_UNIT_ID

-- 対象ユーザの所属するグループ情報取得時に用いるSQL
SELECT_UGROUP=
SELECT
    UG.UGROUP_ID,
    UG.UGROUP_NAME
FROM
    UGROUP UG
INNER JOIN
    UGROUP_SYSTEM_ACCOUNT UGSA
ON
    UG.UGROUP_ID = UGSA.UGROUP_ID
WHERE
    UGSA.USER_ID = ?

-- システムアカウント挿入用SQL
INSERT_SYSTEM_ACCOUNT=
INSERT INTO
  SYSTEM_ACCOUNT
  (
  USER_ID,
  LOGIN_ID,
  PASSWORD,
  USER_ID_LOCKED,
  PASSWORD_EXPIRATION_DATE,
  FAILED_COUNT,
  EFFECTIVE_DATE_FROM,
  EFFECTIVE_DATE_TO,
  INSERT_USER_ID,
  INSERT_DATE,
  UPDATED_USER_ID,
  UPDATED_DATE
  )
VALUES
    (
    :userId,
    :loginId,
    :password,
    :userIdLocked,
    :passwordExpirationDate,
    :failedCount,
    :effectiveDateFrom,
    :effectiveDateTo,
    :insertUserId,
    :insertDate,
    :updatedUserId,
    :updatedDate
    )


-- ユーザ挿入用SQL
INSERT_USERS=
INSERT INTO
  USERS
  (
  USER_ID,
  KANJI_NAME,
  KANA_NAME,
  MAIL_ADDRESS,
  EXTENSION_NUMBER_BUILDING,
  EXTENSION_NUMBER_PERSONAL,
  MOBILE_PHONE_NUMBER_AREA_CODE,
  MOBILE_PHONE_NUMBER_CITY_CODE,
  MOBILE_PHONE_NUMBER_SBSCR_CODE,
  INSERT_USER_ID,
  INSERT_DATE,
  UPDATED_USER_ID,
  UPDATED_DATE
  )
VALUES
    (
    :userId,
    :kanjiName,
    :kanaName,
    :mailAddress,
    :extensionNumberBuilding,
    :extensionNumberPersonal,
    :mobilePhoneNumberAreaCode,
    :mobilePhoneNumberCityCode,
    :mobilePhoneNumberSbscrCode,
    :insertUserId,
    :insertDate,
    :updatedUserId,
    :updatedDate
    )


-- グループシステムアカウント挿入用SQL
INSERT_UGROUP_SYSTEM_ACCOUNT=
INSERT INTO
  UGROUP_SYSTEM_ACCOUNT
  (
  USER_ID,
  UGROUP_ID,
  EFFECTIVE_DATE_FROM,
  EFFECTIVE_DATE_TO,
  INSERT_USER_ID,
  INSERT_DATE,
  UPDATED_USER_ID,
  UPDATED_DATE
  )
VALUES
    (
    :userId,
    :ugroupId,
    :effectiveDateFrom,
    :effectiveDateTo,
    :insertUserId,
    :insertDate,
    :updatedUserId,
    :updatedDate
    )

-- システムアカウント権限挿入用SQL
INSERT_SYSTEM_ACCOUNT_AUTHORITY=
INSERT INTO
  SYSTEM_ACCOUNT_AUTHORITY
  (
  USER_ID,
  PERMISSION_UNIT_ID,
  INSERT_USER_ID,
  INSERT_DATE,
  UPDATED_USER_ID,
  UPDATED_DATE
  )
VALUES
    (
    :userId,
    :permissionUnitId,
    :insertUserId,
    :insertDate,
    :updatedUserId,
    :updatedDate
    )

    
-- ユーザIDに紐づくユーザテーブル情報の削除時に用いるSQL
DELETE_USERS=
DELETE FROM
    USERS
WHERE
    USER_ID = ?


-- ユーザIDに紐づくシステムアカウントテーブル情報の削除時に用いるSQL
DELETE_SYSTEM_ACCOUNT=
DELETE FROM
    SYSTEM_ACCOUNT
WHERE
    USER_ID = ?


-- ユーザIDに紐づくユーザグループシステムアカウントテーブル情報の削除時に用いるSQL
DELETE_UGROUP_SYSTEM_ACCOUNT=
DELETE FROM
    UGROUP_SYSTEM_ACCOUNT
WHERE
    USER_ID = ?


-- ユーザIDに紐づくシステムアカウント権限テーブル情報の削除時に用いるSQL
DELETE_SYSTEM_ACCOUNT_AUTHORITY=
DELETE FROM
    SYSTEM_ACCOUNT_AUTHORITY
WHERE
    USER_ID = ?

-- ユーザ詳細情報取得SQL
SELECT_DETAILED_USER_INFO=
SELECT
 SA.USER_ID,
 SA.LOGIN_ID,
 SA.EFFECTIVE_DATE_FROM,
 SA.EFFECTIVE_DATE_TO,
 SA.USER_ID_LOCKED,
 U.KANJI_NAME,
 U.KANA_NAME,
 U.MAIL_ADDRESS,
 U.EXTENSION_NUMBER_BUILDING,
 U.EXTENSION_NUMBER_PERSONAL,
 U.MOBILE_PHONE_NUMBER_AREA_CODE,
 U.MOBILE_PHONE_NUMBER_CITY_CODE,
 U.MOBILE_PHONE_NUMBER_SBSCR_CODE,
 USA.UGROUP_ID
FROM SYSTEM_ACCOUNT SA
    INNER JOIN USERS U
        ON SA.USER_ID = U.USER_ID
    INNER JOIN UGROUP_SYSTEM_ACCOUNT USA
        ON SA.USER_ID = USA.USER_ID
WHERE SA.USER_ID = :userId