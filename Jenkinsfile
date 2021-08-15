pipeline{
    agent any
    environment{
        PATH = "/usr/bin:$PATH"
    }
    stages{
        stage("cloning git"){
            steps{
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/vysnu96/azure-build.git'
            }
        }
        stage("build code"){
            steps{
                sh "mvn clean install"
            }
        }
        stage("deploy in tomcat"){
            steps{
                sshagent(['azure-tomcat']) {
                    sh "scp -o StrictHostKeyChecking=no webapp/target/webapp.war vishnu@40.114.25.152:/opt/apache-tomcat-9.0.52/webapps/"
}
            }
        }
    }
}
