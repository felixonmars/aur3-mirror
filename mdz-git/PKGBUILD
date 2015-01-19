# Maintainer: u8sand < u8sand at gmail dot com >
# Contributor: Philipp Überbacher < murks at lavabit dot com >

pkgname=mdz-git
pkgver=0.1.1
pkgrel=2
pkgdesc="Mandelbrot Deep Zoom, Mandelbrot Set explorer and image renderer"
url="http://jwm-art.net/mdz/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('mpfr' 'gtk2')
conflicts=('mdz')
provides=('mdz')
source=(mdz.patch)
md5sums=('d8ac4e0e64050b4b3c035ff01e0a909f')

_gitroot="https://github.com/jwm-art-net/MDZ.git"
_gitname="master"

build() {
  cd "$srcdir"
  git clone ${_gitroot} -b ${_gitname} ${pkgname}
  cd "$pkgname/src"

  patch Makefile ${srcdir}/mdz.patch
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  make PREFIX=${pkgdir}/usr install
}
