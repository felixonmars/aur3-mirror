# Maintainer: Patrick Chilton <chpatrick@gmail.com>
pkgname=coan
pkgver=5.2
pkgrel=1
pkgdesc="C/C++ Configuration Analyser"
arch=('i686' 'x86_64')
url="http://coan2.sourceforge.net/"
license=('BSD')
groups=()
depends=()
makedepends=('perl')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/coan2/v5.2/coan-5.2.tar.gz?r=&ts=1394014176&use_mirror=garr)
noextract=()
md5sums=('12443b8e45b6868517a2257ca05e450f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

