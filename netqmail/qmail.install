#!/bin/sh

_add_group() {
    getent group $1 >/dev/null || groupadd -g $2 $1
}

_add_user() {
    getent passwd $1 >/dev/null || useradd -u $2 -g $4 -s /bin/false -d $3 $1
}

add_users() {
    _add_group nofiles 200
    _add_group qmail 201
    _add_user alias 200 /var/qmail/alias nofiles
    _add_user qmaild 201 /var/qmail nofiles
    _add_user qmaill 202 /var/qmail nofiles
    _add_user qmailp 203 /var/qmail nofiles
    _add_user qmailq 204 /var/qmail qmail
    _add_user qmailr 205 /var/qmail qmail
    _add_user qmails 206 /var/qmail qmail
}

post_install() {
    add_users
    post_upgrade
}

_chownmod() {
    _own=$1
    _mod=$2
    shift 2
    chown $_own "$@"
    chmod $_mod "$@"
}

_change_bin_perms() {
    _chownmod root:qmail 755 \
        $_bindir/{datemail,elq,forward,maildir2mbox,mailsubj,pinq} \
        $_bindir/{predate,qail,qmail-{inject,qmqpc,showctl},sendmail} \
        $_bindir/{bouncesaying,condredirect,config-fast,except,preline,qbiff} \
        $_bindir/qmail-{pop3d,qmqpd,qmtpd,qread,qstat,smtpd,tcpok,tcpto} \
        $_bindir/{qreceipt,qsmhook,tcp-env}
    _chownmod root:qmail 711 \
        $_bindir/qmail-{clean,getpw,local,popup,pw2u,remote,rspawn,send} \
        $_bindir/splogger
    _chownmod root:qmail 700 \
        $_bindir/qmail-{lspawn,newmrh,newu,start}
    _chownmod qmailq:qmail 4711 \
        $_bindir/qmail-queue
}

post_upgrade() {
    _bindir=/usr/bin
    _confdir=/etc/qmail
    _vardir=/var/qmail

    chown root:qmail \
        $_confdir/{,control,users} $_vardir
    chown alias:qmail \
        $_confdir/alias

    _change_bin_perms
}

pre_remove() {
    userdel alias		>& /dev/null
    userdel qmaild	>& /dev/null
    userdel qmaill	>& /dev/null
    userdel qmailp	>& /dev/null
    userdel qmailq	>& /dev/null
    userdel qmailr	>& /dev/null
    userdel qmails	>& /dev/null
    groupdel nofiles	>& /dev/null
    groupdel qmail	>& /dev/null
}

_op=$1
shift

$_op "$@"
