pkgname=chibi-scheme-emscripten-hg
pkgver=2230
pkgrel=1
pkgdesc="Minimal Scheme Implementation for use as an Extension Language: hg version with emscripten support"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('mercurial')
provides=('chibi-scheme-hg')
conflicts=('chibi-scheme')
url="http://synthcode.com/wiki/chibi-scheme"
license=('custom:BSD')
source=('chibi-scheme-emscripten::hg+https://code.google.com/r/marcnieper-chibi-scheme/#branch=emscripten')
md5sums=('SKIP')
_hgrepo='chibi-scheme-emscripten'

pkgver() {
  cd ${srcdir}/$_hgrepo
  hg identify -n
}

build() {
  cd ${srcdir}/$_hgrepo
  make PREFIX=/usr
}

package() {
  cd ${srcdir}/$_hgrepo
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}


