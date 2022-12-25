function __fish_aqua_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] = "aqua" ]
        return 0
    end
    return 1
end

function __fish_aqua_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

function __fish_aqua_help_topics
    for c in init init-policy install update-aqua generate which exec list generate-registry completion version cp update-checksum
        printf "%s\thelp topic\n" $c
    end
end

function __fish_aqua_completion_topics
    for c in bash zsh
        printf "%s\tcompletion topic\n" $c
    end
end

complete -f -c aqua -n "__fish_aqua_needs_command" -a help -d "Shows a list of commands or help for one command"
complete -f -c aqua -n "__fish_aqua_using_command help" -a "(__fish_aqua_help_topics)"

complete -f -c aqua -n "__fish_aqua_needs_command" -a init -d "Create a configuration file if it doesn't exist"

complete -f -c aqua -n "__fish_aqua_needs_command" -a init-policy -d "Create a policy file if it doesn't exist"

complete -f -c aqua -n "__fish_aqua_needs_command" -a install -d "Install tools"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l only-link -s l -d "create links but skip downloading packages (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l test -d "test file.src after installing the package (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l all -s a -d "install all aqua configuration packages (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l tags -s t -d "filter installed packages with tags"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l exclude-tags -d "exclude installed packages with tags"

complete -f -c aqua -n "__fish_aqua_needs_command" -a update-aqua -d "Update aqua"

complete -f -c aqua -n "__fish_aqua_needs_command" -a generate -d "Search packages in registries and output the configuration interactively"
complete -f -c aqua -n "__fish_aqua_needs_command install" -s f -d "the file path of packages list. When the value is "-", the list is passed from the standard input"
complete -f -c aqua -n "__fish_aqua_needs_command install" -s i -d "Insert packages to configuration file (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l pin -d "Pin version (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command install" -s o -d "inserted file"
complete -f -c aqua -n "__fish_aqua_needs_command install" -l select-version -s s -d "Select the installed version interactively (default: false)"

complete -f -c aqua -n "__fish_aqua_needs_command" -a which -d "Output the absolute file path of the given command"

complete -f -c aqua -n "__fish_aqua_needs_command" -a exec -d "Execute tool"

complete -f -c aqua -n "__fish_aqua_needs_command" -a list -d "List packages in Registries"

complete -f -c aqua -n "__fish_aqua_needs_command" -a generate-registry -d "Generate a registry's package configuration"

complete -f -c aqua -n "__fish_aqua_needs_command" -a completion -d "Output shell completion script for bash or zsh"
complete -f -c aqua -n "__fish_aqua_using_command completion" -a "(__fish_aqua_completion_topics)"

complete -f -c aqua -n "__fish_aqua_needs_command" -a version -d "Show version"

complete -f -c aqua -n "__fish_aqua_needs_command" -a cp -d "Copy executable files in a directory"
complete -f -c aqua -n "__fish_aqua_needs_command cp" -s o -d 'destination directory (default: "dist")'
complete -f -c aqua -n "__fish_aqua_needs_command cp" -l all -s a -d "install all aqua configuration packages (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command cp" -l tags -s t -d "filter installed packages with tags"
complete -f -c aqua -n "__fish_aqua_needs_command cp" -l exclude-tags -d "exclude installed packages with tags"

complete -f -c aqua -n "__fish_aqua_needs_command" -a update-checksum -d "Create or Update .aqua-checksums.json"
complete -f -c aqua -n "__fish_aqua_needs_command cp" -l all -s a -d "Create or Update all .aqua-checksums.json including global configuration (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command cp" -l deep -d "If a package's checksum configuration is disabled, download the asset and calculate the checksum (default: false)"

complete -f -c aqua -n "__fish_aqua_needs_command" -l config -s c -d "configuration file path [\$AQUA_CONFIG]"
complete -f -c aqua -n "__fish_aqua_needs_command" -l cpu-profile -d "cpu profile output file path"
complete -f -c aqua -n "__fish_aqua_needs_command" -l help -s h -d "show help (default: false)"
complete -f -c aqua -n "__fish_aqua_needs_command" -l log-level -d "log level [\$AQUA_LOG_LEVEL]"
complete -f -c aqua -n "__fish_aqua_needs_command" -l trace -d "trace output file path"
complete -f -c aqua -n "__fish_aqua_needs_command" -l version -s v -d "print the version (default: false)"
