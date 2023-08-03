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

    for(int i = 0; i <= stageMatrix.size; i++){
        def value = stageMatrix[i]
        sh "echo 'Achebe'"
    }
    
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