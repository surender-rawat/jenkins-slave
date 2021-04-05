pipeline { 

    environment { 
        registry = "ssrawat/jenkins-slave" 
        registryCredential = '52d2ca1e-cf01-4b6a-906e-b2da7f260cb2' 
        dockerImage = '' 
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                checkout scm 

            }

        } 

        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

    }

}
