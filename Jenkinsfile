node {
    stage('Test Stage'){
        ws('/var/lib/jenkins/workspace/achebe'){
            def nodeImage = docker.image('achebeh/conduit-app')
            nodeImage.inside('-u root:root',{
            sh 'echo pulled'
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