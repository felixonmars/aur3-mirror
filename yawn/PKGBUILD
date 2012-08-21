# Maintainer: neos300 <neos300@neos300.com>
pkgname=yawn
pkgver=0.1
pkgrel=3
pkgdesc="A simple window manager"
arch=('i686' 'x86_64')
url="http://neos300.com"
license=('MIT')
groups=()
depends=('dmenu' 'xorg-server' 'xorg-server-common' 'xorg-xinit')
makedepends=(make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://neos300.com/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('86d980c6a26140ab1f69574171fed442')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
