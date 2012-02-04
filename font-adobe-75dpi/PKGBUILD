# Maintainer: Cedric de Wijs <cedric.dewijs@telfort.nl>
pkgname=font-adobe-75dpi
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
provides=('font-adobe-75dpi')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://xorg.freedesktop.org/releases/individual/font/font-adobe-75dpi-1.0.3.tar.bz2")
noextract=()
md5sums=('6c9f26c92393c0756f3e8d614713495b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
