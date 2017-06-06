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
                sh 'make build_all'
            }
        }
        stage('Deploy staging') {
            steps {
                sh 'make run'
            }
        }
        stage('Staging tests') {
            steps {
                sh 'make run_tests'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'make clean'
            }
        }
    }
}
