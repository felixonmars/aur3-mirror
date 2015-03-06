# Maintainer: Miles Sandlar <miles at userbound.com>
pkgname=bar-aint-recursive
pkgver=1.0.28.ge9cdee9
pkgrel=1
pkgdesc='bar aint recursive by the LemonBoy. A lightweight xcb based bar.'
arch=('i686' 'x86_64')
url='https://github.com/LemonBoy/bar'
license=('MIT')
depends=('libxcb')
makedepends=('git')
provides=('bar')
conflicts=('bar')
source=('git://github.com/LemonBoy/bar.git')
md5sums=('SKIP')
_gitname=bar

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --tags|sed 's+^v++'|sed 's+-+.+g'
}

build() {
  cd "$srcdir/${_gitname}"
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -D -m644 LICENSE \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}