# Maintainer: jiuren <qiuwei1987@domain.com>
pkgname=pidgin-microblog-sina
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Sina microblog plugin for pidgin"
arch=(i686)
url="http://code.google.com/p/libpurple-microblog-sina/"
license=('GPLv2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://libpurple-microblog-sina.googlecode.com/files/$pkgname.tar.gz)
noextract=()
md5sums=('15127e1eb6d32072cfbdfca7176cc022')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

