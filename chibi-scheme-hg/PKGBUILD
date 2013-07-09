pkgname=chibi-scheme-hg
pkgver=1626
pkgrel=1
pkgdesc="Minimal Scheme Implementation for use as an Extension Language: hg version"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('mercurial')
provides=('chibi-scheme')
conflicts=('chibi-scheme')
url="http://synthcode.com/wiki/chibi-scheme"
license=('BSD-like')
source=('chibi-scheme::hg+https://chibi-scheme.googlecode.com/hg/')
md5sums=('SKIP')
_hgrepo='chibi-scheme'

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
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$_hgrepo/COPYING
}


