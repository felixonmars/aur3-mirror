# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=eskdx
pkgver=0.97
pkgrel=1
pkgdesc="Latex package and class suite for ESKD standards system"
arch=('any')
url="http://eskdx.org.ua/"
license=('GPL')
groups=()
depends=(texlive-core)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://eskdx.org.ua/downloads/$pkgname-$pkgver.zip)
noextract=()
md5sums=('f145c27c13ebf87b760171e15a3c720e')
install=eskdx.install

build() {
  cd "$srcdir/$pkgname-$pkgver/unpacked"
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/eskdx
  cp * $pkgdir/usr/share/texmf/tex/latex/eskdx
}

