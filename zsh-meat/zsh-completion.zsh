#compdef meat
_operations=(
    '(-h --help)'{*-h,--help}'[display this help and exit]: :->help'
    '(-d --download)'{-d,--download}'[download and install target(s). (dependencies will be automatically resolved)]: :->download'
    '(-G --git-db-update)'{-G,--git-db-update}'[updates the git database with new sums, without actually installing anything (unstable).]: :->git'
     {-i,--info}"[show info for target(s). (pass twice for more detail)]:->info"
    '(-m --msearch)'{-m,--msearch}'[show packages maintained by target(s)]: :->msearch'
    '(-s --search)'{-s,--search}'[search AUR for target(s)]: :->search'
    '(-u --update)'{-u,--update}'[check for updates against AUR and install them]: :->update'
    '(-U --listupdates)'{-U,--listupdates}'[check for updates against AUR and print them. (acts the same way as cower -u)]: :->listupdates'
    )

_common_opts=(
    '(-f --force)'{-f,--force}'[no matter what happens, keep going. (not recommended)]'
    '(-t --target)'{-t,--target}'[download to DIR, instead of "${TMPDIR:-/tmp}"]'
    '--ignorerepo[ignore a binary repo. REPO is a comma-separated list of repositories. may be used more than once]:repositories:_repositories'
    '--ignore[ignore PKG when upgrading. PKG is a comma-separated list of packages. may be used more than once]:packages:_installed_packages' 
    )

_down_up_opts=(
    '--sign[sign packages made with makepkg]'
    )

_update_opts=(
    '(-g --git-check)'{-g,--git-check}'[check and update checksums for git files. (unstable)]'
    )

_git_up_opts=(
    '--ignoregit[ignore PKG when checking for git updates. PKG is a comma-separated list of packages. may be used more than once]:packages:_installed_packages'
    )

_all_opts=(
    '--nossl[do not use https connections]'
    '--threads[limit number of threads created to NUM]'
    '--timeout[specify connection timeout in seconds]'
    '--check-all[when installing, prompts you to check every regular file in the package directory instead of just the PKGBUILD and .install files]'
    '(-c --color)'{-c+,--color=-}'[use colored output. WHEN is never, always, or auto]::color options:_colors'
    '--debug[show debug output]'
    '(-q --quiet)'{-q,--quiet}'[output less. if both -q and -v are used, each -q is equivalent to removing a -v]'
    '(-v --verbose)'{-v,--verbose}'[output more. may be specified multiple times for even more information]'
    )

# these are all taken from _cower
_colors(){
    local -a color_list
    color_list=(always auto never)
    compadd "$@" -a color_list
}

_aur() {
  local -a aur_packages
  aur_packages=($(_call_program packages "$service" -sq "$words[CURRENT]" 2>/dev/null))
  compadd "$@" -a aur_packages
}

_format() {
  arguments=(%c %d %i %l %n %o %p %t %u %v %%)
  if [[ "$words" = *-i*i* ]]; then
    arguments+=(%C %D %M %O %P %R)
  fi
  compadd "$@" -a arguments
}

_repositories() {
  local -a cmd repositories
  repositories=(${(o)${${${(M)${(f)"$(</etc/pacman.conf)"}:#\[*}/\[/}/\]/}:#options})
  # Uniq the array
  typeset -U repositories
  compadd "$@" -a repositories
}

_installed_packages() {
  local -a cmd packages packages_long
  packages_long=(/var/lib/pacman/local/*(/))
  packages=( ${${packages_long#/var/lib/pacman/local/}%-*-*} )
  compadd "$@" -a packages
}

_meat(){
    local context state line dosearch=0
    typeset -A opt_args
    case "-${${words[*]#*-}%% *} " in
        '-h '|--help)
            state=help
            ;;
        '-d '|--download)
            state=download
            ;;
        '-G '|--git-db-update)
            state=git
            ;;
        '-i '|'-ii '|--info)
            state=info
            ;;
        '-m '|--msearch)
            state=msearch
            ;;
        '-s '|--search)
            state=search
            ;;
        '-u '|--update)
            state=update
            ;;
        '-U '|--listupdates)
            state=listupdates
            ;;
        *)
            _arguments \
                "$_operations[@]"
            ;;
    esac

    [[ ( "${#words[CURRENT]}" -gt 2 && "$words[CURRENT]" != -* ) || ( "${#words[@]}" -gt 1 && -z "${${words:1}:#-*}" ) ]] && dosearch=1;

    case "$state" in
        download)
            if (( dosearch )); then
                _arguments : \
                    "*:aur packages:_aur"
            else
                _arguments : \
                    '-d' \
                    "$_all_opts[@]" \
                    "$_common_opts[@]" \
                    "$_down_up_opts[@]"
            fi
            ;;
        info)
            if (( dosearch )); then
                _arguments : \
                    "*:aur packages:_aur"
            else
            _arguments : \
                "$_all_opts[@]" \
                '--format=-[print package output according to STRING]::string:_format' \
                '*-i[more detail]' \
                '--info[more detail]'
            fi
            ;;
        git)
            _arguments : \
                '-G' \
                "$_common_opts[@]" \
                "$up_git_opts[@]" \
                "$all_opts[@]"
            ;;
        msearch)
            _arguments \
                '-m' \
                '--format=-[print package output according to STRING]::string:_format' \
                "$_all_opts[@]"
            ;;
        search)
            if (( dosearch )); then
                _arguments : \
                    "*:aur packages:_aur"
            else
                _arguments : \
                    '-s' \
                    "$_all_opts[@]" \
                    '--format=-[print package output according to STRING]:string:_format'
            fi
            ;;
        update)
            _arguments : \
                '-u' \
                "$_all_opts[@]" \
                "$_common_opts[@]" \
                "$_git_up_opts[@]" \
                "$_down_up_opts[@]" \
                "$_update_opts[@]"
                ;;
        listupdates)
            _arguments \
                '-U' \
                "$_all_opts[@]"
            ;;
        help)
            return 1
            ;;
   esac
}

_meat "$@"
