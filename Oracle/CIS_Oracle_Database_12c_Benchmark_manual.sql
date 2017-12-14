/** 
 * Reference: CIS Oracle Database 12c Benchmark v2.0.0 - 12-28-2016
 * Prepared By: Gary Kong (g4xyk00@gmail.com)
**/

/** 1: Oracle Database Installation and Patching Requirements
**/
SELECT * FROM DBA_USERS_WITH_DEFPWD;
SELECT * FROM ALL_USERS;

/** 2: Oracle Parameter Settings
 * Listener Settings
 * Database Settings
**/
SELECT * FROM V$PARAMETER;

SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = 'AUDIT_SYS_OPERATIONS'
OR UPPER(NAME) = 'AUDIT_TRAIL'
OR UPPER(NAME) = 'GLOBAL_NAMES'
OR UPPER(NAME) = 'LOCAL_LISTENER'
OR UPPER(NAME) = 'O7_DICTIONARY_ACCESSIBILITY'
OR UPPER(NAME) = 'OS_ROLES'
OR UPPER(NAME) = 'REMOTE_LISTENER'
OR UPPER(NAME) = 'REMOTE_LOGIN_PASSWORDFILE'
OR UPPER(NAME) = 'REMOTE_OS_AUTHENT'
OR UPPER(NAME) = 'REMOTE_OS_ROLES'
OR UPPER(NAME) = 'UTL_FILE_DIR'
OR UPPER(NAME) = 'SEC_CASE_SENSITIVE_LOGON'
OR UPPER(NAME) = 'SEC_MAX_FAILED_LOGIN_ATTEMPTS'
OR UPPER(NAME) = 'SEC_PROTOCOL_ERROR_FURTHER_ACTION'
OR UPPER(NAME) = 'SEC_PROTOCOL_ERROR_TRACE_ACTION'
OR UPPER(NAME) = 'SEC_RETURN_SERVER_RELEASE_BANNER'
OR UPPER(NAME) = 'SQL92_SECURITY'
OR UPPER(NAME) = '_TRACE_FILES_PUBLIC'
OR UPPER(NAME) = 'RESOURCE_LIMIT';

/** CIS Recommended Settings 

2.2.1	AUDIT_SYS_OPERATIONS				TRUE
2.2.2	AUDIT_TRAIL							DB or OS or XML or DB,EXTENDED or XML,EXTENDED
2.2.3	GLOBAL_NAMES						TRUE
2.2.4	LOCAL_LISTENER						[description]
2.2.5	O7_DICTIONARY_ACCESSIBILITY			FALSE
2.2.6	OS_ROLES							FALSE
2.2.7	REMOTE_LISTENER						[empty]
2.2.8	REMOTE_LOGIN_PASSWORDFILE			NONE
2.2.9	REMOTE_OS_AUTHENT					FALSE
2.2.10	REMOTE_OS_ROLES						FALSE
2.2.11	UTL_FILE_DIR						[empty]
2.2.12	SEC_CASE_SENSITIVE_LOGON			TRUE
2.2.13	SEC_MAX_FAILED_LOGIN_ATTEMPTS		10
2.2.14	SEC_PROTOCOL_ERROR_FURTHER_ACTION	DELAY,3 or DROP,3
2.2.15	SEC_PROTOCOL_ERROR_TRACE_ACTION		LOG
2.2.16	SEC_RETURN_SERVER_RELEASE_BANNER	FALSE
2.2.17	SQL92_SECURITY						TRUE
2.2.18	_TRACE_FILES_PUBLIC					FALSE 
2.2.19	RESOURCE_LIMIT						TRUE
**/


/** 3: Oracle Connection and Login Restrictions
**/
SELECT * FROM DBA_PROFILES;
SELECT * FROM DBA_USERS;

SELECT * FROM DBA_PROFILES 
WHERE RESOURCE_NAME = "FAILED_LOGIN_ATTEMPTS"
OR RESOURCE_NAME = "PASSWORD_LOCK_TIME"
OR RESOURCE_NAME = "PASSWORD_LIFE_TIME"
OR RESOURCE_NAME = "PASSWORD_REUSE_MAX"
OR RESOURCE_NAME = "PASSWORD_REUSE_TIME"
OR RESOURCE_NAME = "PASSWORD_GRACE_TIME"
OR RESOURCE_NAME = "PASSWORD_VERIFY_FUNCTION"
OR RESOURCE_NAME = "SESSIONS_PER_USER";

SELECT USERNAME
FROM DBA_USERS
WHERE PASSWORD='EXTERNAL';

SELECT USERNAME
FROM DBA_USERS
WHERE PROFILE='DEFAULT'
AND ACCOUNT_STATUS='OPEN'
AND USERNAME NOT IN
('ANONYMOUS', 'CTXSYS', 'DBSNMP', 'EXFSYS', 'LBACSYS',
'MDSYS', 'MGMT_VIEW','OLAPSYS','OWBSYS', 'ORDPLUGINS',
'ORDSYS', 'OUTLN', 'SI_INFORMTN_SCHEMA','SYS',
'SYSMAN', 'SYSTEM', 'TSMSYS', 'WK_TEST', 'WKSYS',
'WKPROXY', 'WMSYS', 'XDB', 'CISSCAN');

/** CIS Recommended Settings 

3.1	FAILED_LOGIN_ATTEMPTS		5
3.2 PASSWORD_LOCK_TIME			1
3.3 PASSWORD_LIFE_TIME			90
3.4 PASSWORD_REUSE_MAX			20
3.5 PASSWORD_REUSE_TIME			365
3.6 PASSWORD_GRACE_TIME			5
3.8 PASSWORD_VERIFY_FUNCTION	*Custom Password*
3.9 SESSIONS_PER_USER			10

**/


/** 4: Oracle User Access and Authorization Restrictions
 * Default Public Privileges for Packages and Object Types
 * Revoke Non-Default Privileges for Packages and Object Types
 * Revoke Excessive System Privileges
 * Revoke Role Privileges
 * Revoke Excessive Table and View Privileges
**/
SELECT * FROM DBA_TAB_PRIVS;
SELECT * FROM DBA_SYS_PRIVS;
SELECT * FROM DBA_ROLE_PRIVS;
SELECT * FROM ALL_TABLES

/** 5: Audit/Logging Policies and Procedures
 * Traditional Auditing
 * Unified Auditing
**/
SELECT * FROM DBA_STMT_AUDIT_OPTS;
SELECT * FROM AUDIT_UNIFIED_POLICIES
SELECT * FROM AUDIT_UNIFIED_ENABLED_POLICIES