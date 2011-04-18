augroup filetypedetect
    au! BufRead,BufNewFile /var/log/*/*.log,*.info,*.err set filetype=syslog
augroup END
