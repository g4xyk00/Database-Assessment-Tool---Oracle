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

/** 3: Oracle Connection and Login Restrictions
**/
SELECT * FROM DBA_PROFILES;
SELECT * FROM DBA_USERS;

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