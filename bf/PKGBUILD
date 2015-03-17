# Maintainer: JT Stanley <metredigm@ridley.ftp.sh>
pkgname=bf
pkgver=1.0
pkgrel=1
pkgdesc="A minimal brainfuck interpreter."
arch=('x86_64')
url="http://github.com/metredigm/bf"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source="http://ridley.ftp.sh/files/$pkgname-$pkgver.tar.gz"
noextract=()
sha1sums=('7f1821be60284355e1ed100ece9468f436abf4a6')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
