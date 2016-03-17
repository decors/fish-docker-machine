function __fish_docker_machine_no_command --description 'Test if docker-machine has yet to be given the main command'
    set -l cmd (commandline -opc)
    test (count $cmd) -eq 1
end

function __fish_docker_machine_using_command
    set -l cmd (commandline -opc)
    set -q cmd[2]; and test "$argv[1]" = $cmd[2]
end

function __fish_docker_machine_help_topics
    for c in active config create env inspect ip kill ls regenerate-certs restart rm ssh scp start status stop upgrade url version help
        printf "%s\thelp topic\n" $c
    end
end

function __fish_docker_machine_machines --description 'Lists all available docker machines'
    command docker-machine ls | sed 1d | awk '{print sprintf("%s\t%s %s", $1, $3, $4);}'
end

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'active' -d 'Print which machine is active'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'config' -d 'Print the connection config for machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command config' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'create' -d 'Create a machine'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'env' -d 'Display the commands to set up the environment for the Docker client'
complete -c docker-machine -f -n '__fish_docker_machine_using_command env' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'inspect' -d 'Inspect information about a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command inspect' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'ip' -d 'Get the IP address of a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command ip' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'kill' -d 'Kill a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command kill' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'ls' -d 'List machines'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'regenerate-certs' -d 'Regenerate TLS Certificates for a machine'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'restart' -d 'Restart a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command restart' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'rm' -d 'Remove a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command rm' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'ssh' -d 'Log into or run a command on a machine with SSH.'
complete -c docker-machine -f -n '__fish_docker_machine_using_command ssh' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'scp' -d 'Copy files between machines'
complete -c docker-machine -f -n '__fish_docker_machine_using_command scp' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'start' -d 'Start a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command start' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'status' -d 'Get the status of a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command status' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'stop' -d 'Stop a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command stop' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'upgrade' -d 'Upgrade a machine to the latest version of Docker'
complete -c docker-machine -f -n '__fish_docker_machine_using_command upgrade' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'url' -d 'Get the URL of a machine'
complete -c docker-machine -f -n '__fish_docker_machine_using_command url' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'version' -d 'Show the Docker Machine version or a machine docker version'
complete -c docker-machine -f -n '__fish_docker_machine_using_command version' -a '(__fish_docker_machine_machines)'

complete -c docker-machine -f -n '__fish_docker_machine_no_command' -a 'help' -d 'Shows a list of commands or help for one command'
complete -c docker-machine -f -n "__fish_docker_machine_using_command help" -a "(__fish_docker_machine_help_topics)"
