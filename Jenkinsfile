@Library('shared-library') _
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
    
    def value = environment(gitBranch)
    println(value)
    
    // stage('Test Stage'){
    //     sh "echo ${gitBranch}"
    // }
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