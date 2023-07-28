node {
    checkout scmGit(
        branches: [[name: 'feature/scripting-pipeline']],
        userRemoteConfigs: [
            [ url: 'https://github.com/Okeybukks/react-weather-app.git' ]
    ])
    stage('Test Stage'){
        def nodeImage = docker.image('node:lts-alpine')
            nodeImage.inside('-u root:root',{
                sh "npm -v"
                sh "chmod +x -R ${env.WORKSPACE}"
            })  
    }
    stage("Build Stage"){
        sh 'echo "Hello!"'
        sh 'ls' 
    }
    stage("Dev Deployment"){
        if(env.Branch == "feature/scripting-pipeline"){
            sh 'echo "Scripting-pipeline branch"'
        }
    }
    stage("Prod Deployment"){
        sh 'echo "Hello!"'
    }
}