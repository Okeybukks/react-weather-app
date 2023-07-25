node {
    stage('Test Stage'){
        ws('/var/lib/jenkins/workspace/achebe'){
            def nodeImage = docker.image('node:lts-alpine')
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