env.dockerimagename="devopsbasservice/buildonframework:insights1.0"
node {
   // Platform Service Starts.
   stage ('Insight_PS_Build') {
        checkout scm
		sh 'mvn clean install -DskipTests'
	   }
	
	// Platform UI2.0 Ends
	stage ('SlackNotification') {
   	    slackSend channel: '#random', color: 'good', message: "@insightsbot New Insights artifacts are uploaded to Nexus for commitID ${env.commitID}", teamDomain: 'ctsdevopsbot', token: slackToken
  	}

}
