pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                make build
            }
        }
        stage('Prepare tests') {
            steps {
                make build_tests
            }
        }
        stage('Deploy staging') {
            steps {
                make run
            }
        }
        stage('Test') {
            steps {
                make run_tests
            }
        }
        stage('Cleanup') {
            steps {
                make stop
            }
        }
    }
}
