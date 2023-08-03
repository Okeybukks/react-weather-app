def call(String gitBranch){
    if(gitBranch =~ '^feat' || gitBranch =~ '^dev'){
        def envi = 'dev'
    }
    else if(gitBranch =~ '^mas') {
        def envi = 'prod'
    }

    return envi
}
