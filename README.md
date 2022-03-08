### SmileCDR implementation for ACDC

## Prerequisites 
* SmileCDR account to 'docker login' to
* docker desktop or docker-compose capable environment
* Reverse proxy to: api, admin panel, resource panel, database admin and web form

## Methodology
* docker-compose up --build
* configure reverse proxy to relevant sub-domains
* add user with sftp home that can access database/export files
 
## Colloborators
oridashi, ronalddendere

## references
* https://smilecdr.com/docs/getting_started/platform_requirements.html#database-requirements
* https://smilecdr.com/docs/installation/docker_container_installation.html
* https://smilecdr.com/docs/appendix/installing_smilecdr_nginx_and_postgresql_in_a_docker_stack.html

## todo
* remove database errors: Follow this: https://smilecdr.com/docs/database_administration/setting_up_postgresql.html
* add form that submits to API
* build auth layer 
* Setup CORS
