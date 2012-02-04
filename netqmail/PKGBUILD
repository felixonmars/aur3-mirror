# Contributor: Alexander Zubkov <green@msu.ru>

pkgname=netqmail
pkgver=1.06
pkgrel=9
pkgdesc="Secure, reliable, efficient, simple MTA"
arch=('i686' 'x86_64')
url="http://netqmail.org"
license=('public-domain')
depends=('glibc' 'openssl')
provides=('qmail')
install=qmail.install
_bigtodo_v=103
_bigtodo_f="big-todo.$_bigtodo_v.patch"
_smtpauth_vn="1.05"
_smtpauth_vd="20070417"
_smtpauth_f="netqmail-$_smtpauth_vn-tls-smtpauth-$_smtpauth_vd.patch"
_qqcustom_f="qmail-queue-custom-error-mod.patch"
_bigdns_f="qmail-103.patch"
_ipv6_v=20021006
_ipv6_f="netqmail-tls-$pkgver-ipv6-$_ipv6_v.patch"
_tlsbefore_f="qmail-smtpd-tlsbeforeauth.patch"
source=("http://netqmail.org/$pkgname-$pkgver.tar.gz"
        "http://qmail.org/$_bigtodo_f"
        "$_smtpauth_f"
        "http://www.ckdhr.com/ckd/$_bigdns_f"
        "$_qqcustom_f"
        "$_ipv6_f"
        "$_tlsbefore_f"
       )
md5sums=('c922f776140b2c83043a6195901c67d3'
         '39b6f70f65056472ff97ab40c1dba7b4'
         '675dbb0b578f80f168b31e90d19e1594'
         '9140ad2b03017145cd7963c84bb24f16'
         '85d38d08294ac863a12f31a17949e210'
         '8ac9dfe2a96383e5c57ae7534a9fe273'
         '95292bf66ed87bf099c033d0b8bc8541'
        )

_test_users() {
    getent group nofiles >/dev/null &&
    getent group qmail >/dev/null &&
    getent passwd alias >/dev/null &&
    getent passwd qmaild >/dev/null &&
    getent passwd qmaill >/dev/null &&
    getent passwd qmailp >/dev/null &&
    getent passwd qmailq >/dev/null &&
    getent passwd qmailr >/dev/null &&
    getent passwd qmails >/dev/null &&
    return 0

    return 1
}

_install_bin() {
    install -m 755 \
        datemail elq forward maildir2mbox mailsubj pinq predate \
        qail qmail-{inject,qmqpc,showctl} sendmail bouncesaying \
        condredirect config-fast except preline qbiff \
        qmail-{pop3d,qmqpd,qmtpd,qread,qstat,smtpd,tcpok,tcpto} \
        qreceipt qsmhook tcp-env \
        $_bindir
    install -m 711 \
        qmail-{clean,getpw,local,popup,pw2u,remote,rspawn,send} splogger \
        $_bindir
    install -m 700 qmail-{lspawn,newmrh,newu,start} $_bindir
    install -m 711 qmail-queue $_bindir # 4711 will be during install
}

build() {
    if [[ ! _test_users ]]
    then
        echo "Error: qmail users and groups should be added before build."
        echo 'You can use "./qmail.install add_users" for this.'
        return 1
    fi
    cd $srcdir/$pkgname-$pkgver
    patch -p4 < $srcdir/$_smtpauth_f || return 1
    patch -p1 < $srcdir/$_bigtodo_f || return 1
    patch -p0 < $srcdir/$_qqcustom_f || return 1
    patch -p1 < $srcdir/$_ipv6_f || return 1
    patch -p1 < $srcdir/$_tlsbefore_f || return 1
    patch -p1 < $srcdir/$_bigdns_f || return 1
    CFLAGS="${CFLAGS} -DINET6 -DTLS_BEFORE_AUTH"
    sed -e "s/^cc\s\+\(-O[0-3]\)\?/cc ${CFLAGS} /" -i conf-cc
    sed -e "s/^cc\s\+\(-s\)\?/cc ${CFLAGS} /" -i conf-ld
    make it man || return 1
    _pkgdir=$startdir/pkg
    _bindir=$_pkgdir/usr/bin
    _confdir=$_pkgdir/etc/qmail
    _vardir=$_pkgdir/var/qmail
    _mandir=$_pkgdir/usr/share/man
    install -d $_confdir/{alias,control,users} $_bindir $_vardir
    _install_bin
    for i in 1 5 7 8
    do
        install -d $_mandir/man$i
        install -m 644 *.$i $_mandir/man$i
    done
    install -d $_pkgdir/usr/{lib,sbin}
    ln -s ../../etc/qmail/{alias,control,users} ../../usr/bin $_vardir
    ln -s ../bin/sendmail $_pkgdir/usr/lib
    ln -s ../bin/sendmail $_pkgdir/usr/sbin
}
