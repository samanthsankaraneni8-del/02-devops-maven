pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Verify Artifact') {
            steps {
                sh 'ls -lh target/'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t javaparser-app:v1 .'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*-shaded.jar', fingerprint: true
            }
        }
    }
}

