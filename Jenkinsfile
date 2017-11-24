node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'
   checkout scm

   sh "sudo chown jenkins /var/run/docker.sock"
   sh "sudo chown jenkins /usr/bin/docker"

   stage 'Build application'
   def mvnHome = tool 'M3'
   sh "${mvnHome}/bin/mvn clean package"
  
  /* stage 'Build Docker image'

   def image = docker.build('jenkins-hello-java:latest', '.')

   stage 'Acceptance Tests'
   image.withRun('-p 9191:9090') {c ->
        sh "${mvnHome}/bin/mvn verify"
   }
   */
   stage 'Build & Push image'
   
   docker.withDockerRegistry('https://54.227.175.229:8446', 'nexus-admin') {
        def customImage = docker.build("jenkins-docker/hello-java:latest")
      
        customImage.withRun('-p 9191:9090') {c ->
        sh "${mvnHome}/bin/mvn verify"
        }  
        /* Push the container to the custom Registry */
        customImage.push()
    }
  
}
