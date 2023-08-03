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

    def stageMatrix = [
        'dev' : ['feature/*', 'develop'],
        'prod': ['master']
    ]

    def gitBranch = env.BRANCH_NAME
    def branch = "feature/*"
    if(gitBranch = (branch =~ '^feat') || gitBranch = (branch[1] =~ '^dev')){
        println(true)
    }
    else{
        println(false)
    }


    // for(int i = 0; i < keys.size(); i++){
    //     def environment = keys[i]
    //     def branch = stageMatrix.get(key)

    //     if(gitBranch = (branch[0] =~ '^feat') || gitBranch = (branch[1] =~ '^dev')){
    //         println(true)
    //     }
    //     else{
    //         println(false)
    //     }
        
    // }
    
    // stage('Test Stage'){
    //     sh "echo ${gitBranch}"
    // }
    // stage("Build Stage"){

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