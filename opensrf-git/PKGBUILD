# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=opensrf-git
pkgver=20110626
pkgrel=1
pkgdesc="A message routing network that offers scalability and failover support."
arch=('i686' 'x86_64')
url="http://evergreen-ils.org/opensrf.php"
license=('GPL')
makedepends=(git)
conflicts=(opensrf)
provides=(opensrf)
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
install=(opensrf.install)
source=(ejabberd.patch)
md5sums=('af29caeb4a55fe2ca7a583ce12412074')

_gitroot='git://git.evergreen-ils.org/OpenSRF.git'
_gitname='OpenSRF'

build() {
    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname --depth=1
      cd $_gitname
    fi
    ./autogen.sh
    ./configure --prefix=/opensrf --sysconfdir=/opensrf/conf
    make
}

package(){
    cd $srcdir/$_gitname
    make DESTDIR=$pkgdir install
    mkdir -p "$pkgdir/opensrf/var/log" "$pkgdir/opensrf/var/run" "$pkgdir/opensrf/var/lock"
    install -Dm644 ../ejabberd.patch ${pkgdir}/etc/ejabberd/opensrf.patch
}

