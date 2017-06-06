#!groovy

pipeline {
    agent {
        label 'jenkins-slaves'
    }

    options {
        timeout(time: 15, unit: 'MINUTES')
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '30'))
    }

    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Prepare tests') {
            steps {
                sh 'make build_tests'
            }
        }
        stage('Deploy staging') {
            steps {
                sh 'make run'
            }
        }
        stage('Test') {
            steps {
                sh 'make run_tests'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'make stop'
            }
        }
    }
}

