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

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*-shaded.jar', fingerprint: true
            }
        }
    }
}

