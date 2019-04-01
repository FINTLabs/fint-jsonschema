pipeline {
    agent {
        label 'docker'
    }
    stages {
        stage('Publish') {
            when {
                branch 'master'
            }
            steps {
                withDockerRegistry([credentialsId: 'fintlabs.azurecr.io', url: 'https://fintlabs.azurecr.io']) {
                    sh "docker build --tag ${GIT_COMMIT} ."
                    sh "docker tag ${GIT_COMMIT} fintlabs.azurecr.io/json-schema:build.${BUILD_NUMBER}"
                    sh "docker push fintlabs.azurecr.io/json-schema:build.${BUILD_NUMBER}"
                }
            }
        }
    }
}
