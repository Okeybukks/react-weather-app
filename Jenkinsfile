@Library('shared-library') _
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
                sh "echo Testing"
            })  

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

        def userInput = input(
            id: "userInput",
            message: "What branch do you want to run?",
            submitterParameter: "What is your Name?",
            parameters: [
                string(name: 'environment', defaultValue: 'Dev', description: 'Valid inputes are: ["Dev", "Prod","Test"]'),
                choice(name: 'region', choices: ['us-east-1a','us-east-1b', description:'region to build infra' ])
            ]
        )
        println(userInput.environment, userInput.region)

        
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