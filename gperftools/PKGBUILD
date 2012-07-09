# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: JaDa <jada@archlinux.us>
# Contributor: Joaquim Pedro <osmano807@gmail.com>
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=gperftools
pkgver=2.0
pkgrel=3
pkgdesc="Fast, multi-threaded malloc() and nifty performance analysis tools"
arch=('x86_64' 'i686')
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('perl')
[[ "$CARCH" != "i686" ]] && depends+=('libunwind>=1.0.1')
optdepends=(
    'graphviz: for pprof graphical output routines'
    'gv: for pprof --gv mode'
)
options=('libtool')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha256sums=('7de3dd91f018825b1e7d332af1edace15c6211f430186febede1835069861080')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:siginfo_t:siginfo:' src/base/linuxthreads.cc
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
