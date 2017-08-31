#!groovy

pipeline {
    agent {
        label 'swarm'
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
        stage('Deploy staging') {
            steps {
                sh 'make run'
            }
        }
        stage('Staging tests: prepare') {
            steps {
                sh 'make build_tests'
            }
        }
        stage('Staging tests: run') {
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
