
node {
   
   stage ('SlackNotification') {
       sh echo 'hii'
       slackSend channel: '#random', color: 'good', message: "@insightsbot New Insights artifacts are uploaded to Nexus for commitID ", teamDomain: 'ctsdevopsbot', token: slackToken
  	}
   

}
