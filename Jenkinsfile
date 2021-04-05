pipeline {
  //  agent { dockerfile true }
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
