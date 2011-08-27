# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=opensrf
pkgver=2.0.0
pkgrel=4
pkgdesc="A message routing network that offers scalability and failover support."
arch=('i686' 'x86_64')
url="http://evergreen-ils.org/opensrf.php"
license=('GPL')
depends=(autoconf \
        automake \
        ejabberd \
        expat \
        gcc \
        gdbm \
        apache \
        less \
        libgcrypt \
	libmemcached \
        libtool \
        libxml2 \
        python-lxml \
        libxslt \
        make \
        memcached \
        mod_perl \
        ntp \
        perl-cache-memcached \
        perl-dbd-sqlite \
        perl-datetime-format-builder \
        perl-datetime-format-iso8601 \
        perl-datetime-format-mail \
        perl-datetime-set \
        perl-error \
        perl-freezethaw \
        perl-json-xs \
        perl-libwww \
        perl-log-log4perl \
        perl-module-build \
        perl-net-jabber \
        perl-net-server \
        perl-template-toolkit \
        perl-test-deep \
        perl-test-exception \
        perl-test-pod \
        perl-tie-ixhash \
        perl-xml-libxml \
        perl-xml-libxslt \
        perl-xml-simple \
        psmisc \
        python2 \
        python-dnspython \
        python-memcached \
        python-simplejson \
        readline \
        perl-file-find-rule \
        perl-rpc-xml \
        perl-sql-abstract-limit \
        perl-unix-syslog \
        perl-universal-require )
install=($pkgname.install)
source=(http://evergreen-ils.org/downloads/$pkgname-$pkgver.tar.gz $pkgname.patch ejabberd.patch)
md5sums=('26e58f327142490c3e779dd108d81d6f' '484032a74fb1adcbb00f896f818e219c'
    'af29caeb4a55fe2ca7a583ce12412074')

build() {
    cd $pkgname-$pkgver
    patch -Np1 -r - -i ../$pkgname.patch
    ./configure --prefix=/opensrf --sysconfdir=/opensrf/conf --enable-python
    make
}

package(){
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
    mkdir -p "$pkgdir/opensrf/var/log" "$pkgdir/opensrf/var/run" "$pkgdir/opensrf/var/lock"
    install -Dm644 ../ejabberd.patch ${pkgdir}/etc/ejabberd/opensrf.patch
}

