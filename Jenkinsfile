node {
    stage('Test Stage'){
        node {
            def dockerImage = docker.image('node:lts-alpine')
            dockerImage.inside{
                'npm -v'
            }
        }
    }
    stage("Build Stage"){
        //cmd
    }
    stage("Dev Deployment"){
        //cmd
    }
    stage("Prod Deployment"){
        //cmd
    }
}