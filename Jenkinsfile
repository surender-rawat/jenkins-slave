pipeline { 

    environment { 
        registry = "ssrawat/jenkins-slave" 
        registryCredential = '52d2ca1e-cf01-4b6a-906e-b2da7f260cb2' 
        dockerImage = '' 
    }

    stages {
    
    stage('Docker Build') {
      steps {
        container ('docker') {
        sh 'docker build -t surender-rawat/jenkins-slave:latest .'
        }
      }
    }
    stage('Docker Push') {
      
      steps {
          container ('docker') {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push shanem/spring-petclinic:latest'
        }
          }
      }
    }
}
