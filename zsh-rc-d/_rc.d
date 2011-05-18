#compdef rc.d

_rc.d () {
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments \
        "1: :->action" \
        "*: :->service"

    case $state in
        action)
            _arguments "1:action:(list help start stop restart)"
            ;;
        service)
            local action="$words[2]"
            curcontext="${curcontext%:*:*}:rc.d-${action}:"

            case $action in
                list)
                    _arguments "*: :"
                    ;;
                help)
                    _arguments "*: :"
                    ;;
                *)
                    _arguments "*: :_services"
                    ;;
            esac
            ;;
    esac
}

_rc.d "$@"

# vim: filetype=zsh
