# Maintainer: Neil Munro <neilmunro@gmail.com>

pkgname=x2
pkgver=1.1.0
pkgrel=2
pkgdesc="A simple, minimal GTK+ text editor with a artsy gui."
arch=('i686' 'x86_64')
url="http://cogworks.zapto.org/projects/x2/archives/"
license=('BSD')
groups=()
depends=(vte gtksourceview2)
makedepends=()
checkdepends=()
optdepends=()
provides=(x2)
source=(http://cogworks.zapto.org/projects/x2/archives/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(6051594f7b7ab835a3bf3b766f40b813) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}