# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: MunkOil
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc-git
_gitname=ncdc
pkgver=r1217.0f20968
pkgrel=1
pkgdesc="Modern and lightweight direct connect client with a friendly ncurses interface"
arch=('i686' 'x86_64' 'arm')
url='http://dev.yorhel.nl/ncdc'
license=('MIT')
depends=('bzip2' 'gnutls' 'ncurses' 'sqlite' 'glib2>=2.28.0')
makedepends=('git')
provides=('ncdc')
conflicts=('ncdc')
source=('git://g.blicky.net/ncdc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
