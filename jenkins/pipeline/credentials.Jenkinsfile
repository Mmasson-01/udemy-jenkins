pipeline{
    agent any
    environment {
        secret = credentials('SECRET_TEXT')
    }
    stages{
        stage("Credentials"){
            steps{
                sh 'echo $secret'
            }
        }
    }
}
