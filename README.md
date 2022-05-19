### SmileCDR implementation for ACDC

## Prerequisites 
* SmileCDR account to 'docker login' to
* docker desktop or docker-compose capable environment
* Reverse proxy to: api, admin, resources panel, database admin, auth and static web form

## Methodology
* docker-compose up --build
* configure reverse proxy open ports to relevant sub-domains (see nginx folder)
* TODO: add user with sftp home that can access database/export files
 
## Administration
1. crontab -e
2. 0 5 * * * /home/ubuntu/smilecdr_repo/dump_db.sh 

## Colloborators
oridashi, ronalddendere

## references
* https://smilecdr.com/docs/getting_started/platform_requirements.html#database-requirements
* https://smilecdr.com/docs/installation/docker_container_installation.html
* https://smilecdr.com/docs/appendix/installing_smilecdr_nginx_and_postgresql_in_a_docker_stack.html
* https://admin.acdc.qcif.edu.au/docs/smart/smart_on_fhir_endpoints.html

## todo
* build auth layer 
* Setup CORS
* add questionnaire resource
* allow questionnaireResponse to be validated.  
* Give pathling an MDJSON file from SMILE


## Endpoints
* https://api.acdc.qcif.edu.au
* https://admin.acdc.qcif.edu.au
* https://db.acdc.qcif.edu.au
* https://data.acdc.qcif.edu.au
* https://static.acdc.qcif.edu.au
* https://auth.acdc.qcif.edu.au
* https://auth.acdc.qcif.edu.au/.well-known/openid-configuration
* https://auth.acdc.qcif.edu.au/endpoint-health
* https://auth.acdc.qcif.edu.au/signin

