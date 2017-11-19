function ls --description 'List contents of directory'
    set -l param --color=auto -a
        if isatty 1
            set param $param --indicator-style=classify
        end
        command ls $param $argv
end