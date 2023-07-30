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
        disableConcurrentBuilds()
    ])
    stage('Test Stage'){
        def nodeImage = docker.image('node:lts-alpine')
            nodeImage.inside('-u root:root',{
                sh "npm -v"
                sh "chmod +x -R ${env.WORKSPACE}"
                sh "echo Testing"
            })  

        def formerBuild = previousBuild.result()
        println(formerBuild)

        // parallel "Parallel 1":{
        //     sh 'echo "Parallel 1"'
        //     sleep 10
        // },
        // "Parallel 2":{
        //     sh 'echo "Parallel 2"'
        //     sleep 10
        // },
        // "Parallel 3":{
        //     sh 'echo "Parallel 3"'
        //     sleep 10
        // }

        
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