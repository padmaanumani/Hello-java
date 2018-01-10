env.dockerimagename="devopsbasservice/buildonframework:insights1.0"
node {
	
   stage ('SlackNotification') {
       echo 'hii'
       slackSend channel: '#random', color: 'good', message: "@insightsbot New Insights artifacts are uploaded to Nexus for commitID ", teamDomain: 'ctsdevopsbot', token: slackToken
  	}
   // Platform Service Starts.
   stage ('Insight_PS_Build') {
	echo 'hello'
        checkout scm
		sh 'mvn clean install -DskipTests'
	   }
	
	// Platform UI2.0 Ends
	stage ('SlackNotification') {
	    echo 'hee'
   	    slackSend channel: '#random', color: 'good', message: "@insightsbot New Insights artifacts are uploaded to Nexus for commitID ", teamDomain: 'ctsdevopsbot', token: slackToken
  	}

}
