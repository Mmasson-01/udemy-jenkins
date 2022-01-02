# Jenkins, From Zero to Hero

Resources: https://github.com/ricardoandre97/jenkins-resources

# Section 4 : Jenkins + Docker

# Section 5 : Jenkins & AWS

# Section 6 : Jenkins & Ansible

## Ansible

-   hosts: inventory is a file where we define all our hosts
-   playbook: script that define all the thing ansible should do

## Jenkins Integration

1. Install then Ansible plugins
2. Install AnsiColor plugin

# Section 7 : Jenkins & Security

## Security plugin

-   Role based authorization strategy
-   Always use the Role based strategy (look for Item Role)

# Section 8 : Tips and tricks

-   Create custom ENV variables

    -   Go to configure system -> environment variables

-   Change Jenkins URL
-   Execute job automatically using CRON jobs
    -   configure job
    -   build triggers -> build periodically -> cron expression
-   Create a generic user to trigger jobs externally
    -   Install plugin **Strict Crumb Issuer**
    -   Manage jenkins -> configure global security -> CSRF Protection -> Prevent Cross Site Request Forgery exploits -> Strict Crumb Issuer -> 2h -> Prevent Breach
-   Trigger a job from bash script

    -   generate crumb : `crumb=$(curl -u "user:password" -s 'http://localhost:8081/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')`
    -   call job with crum: `curl -u "user:password" -H "$crumb" -X POST http://localhost:8081/job/demo-ENV/build?delay=0sec`

-   Trigger a job from bash script with parameter
