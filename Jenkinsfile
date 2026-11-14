pipeline {
    agent any

    environment {
        PROJECT = 'pro'
        COMPOSE = 'Docker-compose.pro.yaml'
    }

    stages {
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        stage('pre-check') {
            steps {
                echo "check docker and compose"
                sh 'docker version'
                sh 'docker compose version'
                sh 'docker compose -p $PROJECT -f $COMPOSE config -q'
            }
        }
        stage('build-image') {
            steps {
                echo "build and run docker compose"
                sh 'docker compose -p $PROJECT -f $COMPOSE up --build -d'
            }
        }
        stage('ls-image') {
            steps {
                sh 'docker image ls'
                sh 'docker compose -p $PROJECT -f $COMPOSE ps'
            }
        }
    }

    post {
        success {
            echo "deploy ok"
        }
        failure {
            echo "failed, showing logs"
            sh 'docker compose -p $PROJECT -f $COMPOSE logs
