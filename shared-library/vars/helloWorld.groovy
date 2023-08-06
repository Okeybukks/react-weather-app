// def call(Map name = [:]) {
//     return "Hello ${name.firstName} ${name.lastName}"
// }

def call(String gitBranch) {
    def envi = ''
    if(gitBranch =~ '^feat' || gitBranch =~ '^dev'){
        envi = 'dev'
    }
    else if(gitBranch =~ '^mas') {
        envi = 'prod'
    }

    return envi
}