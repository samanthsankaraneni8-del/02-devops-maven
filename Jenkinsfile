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
        stage('Trivy Scan') {
    steps {
        sh 'TMPDIR=/var/tmp trivy image --cache-dir /var/tmp/trivy-cache javaparser-app:v1'
    }
}
        stage('ECR Push') {
    steps {
        sh '''
            aws ecr get-login-password --region ap-south-1 |
            docker login --username AWS --password-stdin 539903982266.dkr.ecr.ap-south-1.amazonaws.com

            docker tag javaparser-app:v1 \
            539903982266.dkr.ecr.ap-south-1.amazonaws.com/javaparser-app:v1

            docker push \
            539903982266.dkr.ecr.ap-south-1.amazonaws.com/javaparser-app:v1
        '''
    }
}
        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*-shaded.jar', fingerprint: true
            }
        }
    }
}

