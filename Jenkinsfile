pipeline {
  //  agent { dockerfile true }
  agent any
    stages {
        stage('Test') {
            steps {
                sh 'helm version'
                sh 'kubectl version'
                sh 'docker version'
            }
        }
    }
}
