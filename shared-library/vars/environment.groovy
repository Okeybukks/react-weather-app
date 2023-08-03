def call(String gitBranch){
    if(gitBranch =~ '^feat' || gitBranch =~ '^dev'){
        def environment = 'dev'
    }
    else if(gitBranch =~ '^mas') {
        def environment = 'prod'
    }

    return environment
}
