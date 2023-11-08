pipeline {
  agent any
  stages {
    stage('Static') {
      agent any
      steps {
        withSonarQubeEnv('SonarQube1') {
          waitForQualityGate true
        }

      }
    }

  }
}