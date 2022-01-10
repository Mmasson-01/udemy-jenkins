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

# Section 9 : Jenkins & Email

-   Install Mail plugin (Mailer Plugin)
-   AWS SES

    -   Email Addresses -> Create new email addresses
    -   SMTP Settings -> Create new SMTP credentials
    -   Use one of the SMTP Port

-   Jenkins -> Configure Global

    -   Email Notification -> Use SMTP Authentication.
    -   Jenkins Location -> System Admin email-address
    -   Test configuration

## Jenkins and GMAIL

-   Use SMPT Gmail server
-   Activate less secure app

# Section 10 : Jenkins & Maven

-   Install Maven Plugin (may be built-in)
-   Install GIT Plugin (may be built-in)
-   Find simple Maven app (https://github.com/jenkins-docs/simple-java-maven-app)
-   Global tool config -> add maven
-   Configure the Job -> Build step -> Invoke top-level Maven Targets

## Test Graph with Maven

-   Configure Job
-   Add post-build -> Publish JUnit test result report
-   Add regex for `surefire-reports/*.xml`...something like `target/surefire-reports/*.xml`

## Archie the latest successful artifact

-   Configure Job
-   Add post-build -> Archive the artifact
-   Add regex for `target/*.jar`

# Section 10 : Jenkins & Maven

# Section 11 : Jenkins & GIT

Doc : https://docs.gitlab.com/ee/install/docker.html#install-gitlab-using-docker-compose

# Section 12 : Jenkins & DSL

-   Create jobs from code
-   Seed job : a job that create all jobs. Like the parent of all other jobs

Doc : https://jenkinsci.github.io/job-dsl-plugin/

Security : By default, Job DSL scripts are not enabled.

-   Global security config -> uncheck enable Job DSL security

# Section 12 : CI / CD

Doc : https://www.infoworld.com/article/3271126/ci-cd/what-is-cicd-continuous-integration-and-continuous-delivery-explained.html

# Section 14 : Jenkins Pipeline

-   Install the Jenkins Pipeline plugin

-   Retry: retry command if fail

## Credentials

```groovy
environment {
    secret = credentials('SECRET_TEXT')
}
```

## Install Docker inside Docker container

-   Look at Dockerfile in pipeline
-   Bind docker socket in docker-compose

**_Possible error of permission on docker.sock_**

-
