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
    
    
    stage('Test Stage'){
        def branchEnv = myGitEnvironment(gitBranch)
        println(branchEnv)

        def maven32 = docker.image('node:lts-alpine');
        maven32.inside{
            sh 'mvn -v'
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