pipeline {
    agent any
    
    environment {
        SERVICE_NAME = "bulbclass"
        ORGANIZATION_NAME = "deetechpro"
        DOCKERHUB_USERNAME = "oluwaseyi12"
        REPOSITORY_TAG = "${DOCKERHUB_USERNAME}/${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
    }
   
    stages {
       stage('Docker Build & Push') {
           steps {
               script {
                   withDockerRegistry(credentialsId: 'ffaac626-63cf-4189-83a8-36c94673a414', toolName: 'docker') {
                     sh 'docker build -t ${REPOSITORY_TAG} .'
                     sh 'docker push ${REPOSITORY_TAG}'
                   }
               }   
            }
        }
       
        stage("Install kubectl"){
            steps {
                sh """
                    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    ./kubectl version --client
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'k8scred']) {
                script {
                    // Assuming kubectl is installed locally in the Jenkins environment
                    sh '''
                        # Substitute environment variables in deploy.yaml and apply to Kubernetes
                        envsubst < ${WORKSPACE}/deploy.yaml | ./kubectl apply -f -
                    '''
                    }
                }
            }
        }
    }
}
