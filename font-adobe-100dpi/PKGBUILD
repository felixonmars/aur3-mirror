# Maintainer: Cedric de Wijs <cedric.dewijs@telfort.nl>
pkgname=font-adobe-100dpi
pkgver=1.0.3
pkgrel=1
pkgdesc="font-adobe: Standard Adobe fonts"
arch=('x86_64')
url="http://www.t2-project.org/packages/font-adobe.html"
license=('open source')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('font-adobe-100dpi')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://xorg.freedesktop.org/releases/individual/font/font-adobe-100dpi-1.0.3.tar.bz2")
noextract=()
md5sums=('1347c3031b74c9e91dc4dfa53b12f143')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
