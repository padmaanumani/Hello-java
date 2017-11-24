node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'
   checkout scm

   sh "sudo chown jenkins /var/run/docker.sock"
   sh "sudo chown jenkins /usr/bin/docker"

   stage 'Build application'
   def mvnHome = tool 'M3'
   sh "${mvnHome}/bin/mvn clean package"
  
   stage 'Build Docker image'

   def image = docker.build('devopsbasservice/hello-java:1.0', '.')

   stage 'Acceptance Tests'
   image.withRun('-p 9191:9090') {c ->
        sh "${mvnHome}/bin/mvn verify"
   }
   stage 'Push image'
   docker.withRegistry("https://index.docker.io/v1/", "dockercreds") {
          image.push()
   }

}
