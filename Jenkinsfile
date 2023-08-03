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

    def keys = stageMatrix.keySet()
    envi = 'feature/*'
    def test = (envi =~ '^feat')
    if(test){
        println(true)
    }
    else{
        println(false)
    }


    // for(int i = 0; i < keys.size(); i++){
    //     def key = keys[i]
       
    //     println(stageMatrix.get(key))
        
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