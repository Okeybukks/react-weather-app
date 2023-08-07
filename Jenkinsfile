@Library('shared-library@feature/scripting-pipeline') _
node {
    properties([
        buildDiscarder(
            logRotator(
                numToKeepStr: '5'
            )
        ),
        disableConcurrentBuilds(),
    ])

    def gitBranch = env.BRANCH_NAME
    
    // environment(gitBranch)
    // def envi = ''
    // if(gitBranch =~ '^feat' || gitBranch =~ '^dev'){
    //     envi = 'dev'
    // }
    // else if(gitBranch =~ '^mas') {
    //     envi = 'prod'
    // }

    // println(envi)
    
    
    stage('Test Stage'){
        script {
            def workingDir = checkoutCode("https://github.com/Okeybukks/react-weather-app.git", "feature/scripting-pipeline")
            echo $workingDir
        }
    }
    // stage("Build Stage"){

    // }test
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