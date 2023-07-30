@Library('shared-library') _
node {
    checkout scmGit(
        branches: [[name: 'feature/scripting-pipeline']],
        userRemoteConfigs: [
            [ url: 'https://github.com/Okeybukks/react-weather-app.git' ]
    ])
    properties([
        buildDiscarder(
            logRotator(
                numToKeepStr: '5'
            )
        ),
        disableConcurrentBuilds(),
    ])
    stage('Test Stage'){
        def nodeImage = docker.image('node:lts-alpine')
            nodeImage.inside('-u root:root',{
                sh "npm -v"
                sh "chmod +x -R ${env.WORKSPACE}"
                sh "touch test.txt"
                sh "ls"
            })        
    }
    // stage("Build Stage"){
    //     dir('app'){
    //         sh "npm install"
    //         sh "./scripts/build-script.sh"
    //         archiveArtifacts artifacts: "build/**", fingerprint: true
    //     }
    // }
    // stage("Dev Deployment"){
    //     if(env.Branch == "development"){
    //         dir('shared-library'){
    //             deployReact("dev")
    //         }
    //     }
    // }
    // stage("Prod Deployment"){
    //     if(env.Branch == "production"){
    //         dir('shared-library'){
    //             deployReact("prod")
    //         }
    //     }
    // }
}