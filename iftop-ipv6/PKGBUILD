# Maintainer: Matthew of Boswell <mattboswell at lockmail dot us>
# Contributer: Ariel Popper <https://aur.archlinux.org/account/arielp/>
# Base package Maintainer: Daenyth <Daenyth+Arch at gmail dot com>

_pkgbasename=iftop
pkgname=iftop-ipv6
pkgver=0.17
pkgrel=2
pkgdesc="iftop does for network usage what top(1) does for CPU usage - with ipv6 debian patch"
arch=('i686' 'x86_64')
url="http://www.ex-parrot.com/~pdw/iftop/"
license=('GPL')
depends=('libpcap>=1.0.0')
optdepends=('ncurses: for ncurses interface')
makedepends=('automake')
provides=('iftop')
conflicts=('iftop')
options=('!makeflags')
source=(http://www.ex-parrot.com/~pdw/$_pkgbasename/download/$_pkgbasename-$pkgver.tar.gz
        iftop_complete_ipv6_capability.diff)
md5sums=('062bc8fb3856580319857326e0b8752d'
         'ae0b64224e9d61c33fef22c29f005530')

prepare() {
  cd "$srcdir"
  patch -p0 < iftop_complete_ipv6_capability.diff
}

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man
  make
}

package(){
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
