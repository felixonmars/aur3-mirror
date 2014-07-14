# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bmon
pkgver=3.3
pkgrel=1
pkgdesc="Portable bandwidth monitor and rate estimator"
arch=('i686' 'x86_64')
url="http://github.com/tgraf/bmon/"
license=('MIT')
depends=('ncurses' 'libnl' 'confuse')
makedepends=('autoconf')
source=(http://github.com/tgraf/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('1d62451178d3d682a6cf2778ebade7e63f2a9bebe3d35aef20cf94b51679dcca')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

# License
  install -d "${pkgdir}"/usr/share/licenses/$pkgname
  cat "${srcdir}"/$pkgname-$pkgver/configure.ac | tail -n+4 | head -n19 > \
      "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
