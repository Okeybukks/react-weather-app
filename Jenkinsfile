node {
    stage('Test Stage'){
        node {
            def nodeImage = docker.image('node:lts-alpine')
            nodeImage.pull()
            nodeImage.inside('-u root:root',{
                sh 'npm -v'
            })
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