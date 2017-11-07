pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo '---Build started----!'
        git 'https://github.com/kalaiganeshan/Hello-java.git'
        sh 'mvn clean package -DskipTests=true'
      }
    }
    stage('Test') {
      parallel {
        stage('Unit Tests') {
          steps {
            echo 'Unit Tests Are Awesome!'
          }
        }
        stage('Integration Tests') {
          steps {
            echo 'Integration Tests Are Awesome!'
          }
        }
        stage('Smoke Tests') {
          steps {
            echo 'Where There is Smoke there is Fire!!!'
          }
        }
        stage('Reg Test') {
          steps {
            echo 'Reg Test executed'
          }
        }
      }
    }
    stage('CodeAnalysis') {
      steps {
        echo '-----Sonar Analysis started----'
        sh 'mvn sonar:sonar -Dsonar.host.url=http://54.242.162.103:9000/sonar/ -Dsonar.sources=src/main/java'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Ship It!'
      }
    }
  }
}
