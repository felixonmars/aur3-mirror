# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: JaDa <jada@archlinux.us>
# Contributor: Joaquim Pedro (osmano807) <osmano807@gmail.com>

pkgname=google-perftools
_pkgname=gperftools
pkgver=2.0
pkgrel=1
pkgdesc="Fast, mutli-threaded malloc() and nifty performance analysis tools by google."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('perl')
[[ "$CARCH" == "x86_64" ]] && depends=('perl' 'libunwind>=1.0.1')
optdepends=(
    'graphviz: for pprof graphical output routines'
    'gv: for pprof --gv mode'
)
options=(libtool)
source=(http://$_pkgname.googlecode.com/files/$_pkgname-$pkgver.tar.gz)
md5sums=('13f6e8961bc6a26749783137995786b6')
sha256sums=('7de3dd91f018825b1e7d332af1edace15c6211f430186febede1835069861080')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

# The tests are quite long and sometimes fail for no apparent reason (fail, then
# succeed, then fail, ...), so this function is commented out for now.
#
#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  make check
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
