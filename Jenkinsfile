node {
    stage('Test Stage'){
        ws('/var/lib/jenkins/workspace/achebe'){
            // def nodeImage = docker.image('node:lts-alpine')
            // nodeImage.inside('-u root:root',{
            //     sh "npm -v"
            // })

            checkout scmGit(
                branches: [[name: 'origin/main']],
                remoteUserConfigs: [[
                    url: 'https://github.com/Okeybukks/devops-automation.git'
                ]]
            )

            def builtImage = docker.build('jenkins-test')
            builtImage.inside{
                sh "python3 --version"
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