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

    post {
        always {
            echo 'I will always get executed'
        }
        success {
            echo 'I will always get on success'
        }
        failure {
            echo 'I will always get on failure'
        }
        unstable {
            echo 'I will get executed when job is unstable'
        }
    }
}
