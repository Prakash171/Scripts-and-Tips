Searching artifacts based on Queries can be done using AQL.
 
What is AQL ??
AQL - (Artifactory Query Language) is simple language used to search required artifacts in Jfrog Artifactory repositories !
For executing search functions we need to create a AQL scripts and save with ".aql" extension. (example: <AQL-Script-Name.aql)
 
How to Use AQL Scripts ??
These search scripts can be run against Artifactory for required results (i.e Repository name, Path, Created Date etc.) using the below command.

Syntax:
curl -u<Username>:<Password> -X POST -k https://<artifactory-server-hostname or IP-Address>/artifactory/api/search/aql -T <AQL-Scrip-name>.aql
 
-------------------------------------------------------------------------------------------------------------------------------------------------------
 
Reference:
https://www.jfrog.com/confluence/display/RTF/Artifactory+Query+Language
 
-------------------------------------------------------------------------------------------------------------------------------------------------------
