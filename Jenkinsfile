pipeline {
    agent {
        label 'docker'
    }
    parameters {
        string(name: 'MODEL_VERSION', description: 'Version of model to release')
    }
    stages {
        stage('Build') {
            steps {
                withDockerRegistry([credentialsId: 'fintlabs.azurecr.io', url: 'https://fintlabs.azurecr.io']) {
                    sh "docker build --tag ${GIT_COMMIT} --build-arg TAG_NAME=v${MODEL_VERSION} ."
                }
            }
        }
        stage('Publish') {
            when {
                branch 'master'
            }
            steps {
                sh "docker tag ${GIT_COMMIT} fintlabs.azurecr.io/json-schema:${MODEL_VERSION}-${BUILD_NUMBER}"
                withDockerRegistry([credentialsId: 'fintlabs.azurecr.io', url: 'https://fintlabs.azurecr.io']) {
                    sh "docker push fintlabs.azurecr.io/json-schema:${MODEL_VERSION}-${BUILD_NUMBER}"
                }
            }
        }
        stage('Publish PR') {
            when { changeRequest() }
            steps {
                sh "docker tag ${GIT_COMMIT} fintlabs.azurecr.io/json-schema:${BRANCH_NAME}.${BUILD_NUMBER}"
                withDockerRegistry([credentialsId: 'fintlabs.azurecr.io', url: 'https://fintlabs.azurecr.io']) {
                    sh "docker push fintlabs.azurecr.io/json-schema:${BRANCH_NAME}.${BUILD_NUMBER}"
                }
            }
        }
    }
}
