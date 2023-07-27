node {
    stage('Test Stage'){
        def nodeImage = docker.image('node:lts-alpine')
            nodeImage.inside('-u root:root',{
                sh "npm -v"
                sh "chmod +x -R ${env.WORKSPACE}"
                sh "ls"
                // sh './app/scripts/test.sh'
            }) 
        sh "ls"
    }
    stage("Build Stage"){
        sh 'echo "Hello!"'
    }
    stage("Dev Deployment"){
        if(env.Branch == "feature/scripting-pipeline"){
            sh 'echo "Scripting-pipeline branch"'
        }
    }
    stage("Prod Deployment"){
        sh 'echo "Hello!"'
    }
}