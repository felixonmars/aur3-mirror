# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=bitlbee-otr-bzr
pkgver=1
pkgrel=1
pkgdesc="An IRC to IM gateway. Development version."
arch=('i686' 'x86_64')
url="http://bitlbee.org"
license=('GPL')
depends=('gnutls' 'glib2' 'libotr')
makedepends=('bzr' 'xmlto' 'docbook-xsl')
optdepends=('xinetd: to run bitlbee through xinetd')
provides=(bitlbee)
conflicts=('bitlbee' 'bitlbee-bzr')
install=bitlbee.install
source=(bitlbee.rcd bitlbee.xinetd)
md5sums=('90893b706e0e50d37cfe6b283bc7d46c' 'bdc7683770090463028ec8d583fa34ce')
backup=('etc/bitlbee/welcome.txt' 'etc/bitlbee/motd.txt' 'etc/bitlbee/bitlbee.conf')

_bzrbranch=http://code.bitlbee.org/bitlbee
_bzrmod=bitlbee

build() {
    cd ${srcdir}

    msg "Connecting to the server...."

    bzr checkout ${_bzrbranch}

    msg "BZR checkout done or server timeout"
    msg "Starting make..."

    [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
    cp -r ./${_bzrmod} ./${_bzrmod}-build
    cd ./${_bzrmod}-build
  
    ./configure --prefix=/usr \
                --ssl=gnutls \
                --etcdir=/etc/bitlbee/ \
                --pidfile=/var/run/bitlbee/bitlbee.pid \
                --ipcsocket=/var/run/bitlbee/bitlbee.sock \
                --otr=1 || return 1
    make || return 1
}

package() {
    cd ${srcdir}/${_bzrmod}-build

    install -dm755 ${pkgdir}/var/lib
    install -o65 -g65 -dm0770 ${pkgdir}/var/lib/bitlbee
    install -dm755 ${pkgdir}/var/run
    install -o65 -g65 -dm755 ${pkgdir}/var/run/bitlbee
    install -Dm644 ${srcdir}/bitlbee.xinetd \
        ${pkgdir}/etc/xinetd.d/bitlbee
    install -D -m755 ${srcdir}/bitlbee.rcd \
        ${pkgdir}/etc/rc.d/bitlbee || return 1

    make DESTDIR=${pkgdir} install || return 1
    make DESTDIR=${pkgdir} install-etc || return 1
    make DESTDIR=${pkgdir} install-dev || return 1

#  rm -rf ${srcdir}/${_bzrmod}-build
}

# vim:set ts=2 sw=2 et:
