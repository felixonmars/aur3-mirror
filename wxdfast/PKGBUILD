# Maintainer: JHeaton <jheaton at archlinux dot us>
# Contributor: pbw <pbw at massinfluence dot net>

pkgname=wxdfast
pkgver=0.6.0
pkgrel=1
pkgdesc="An open source multi-threaded download manager."
arch=('any')
url="http://dfast.sourceforge.net"
license=('Unknown')
groups=()
depends=('wxgtk')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://prdownloads.sourceforge.net/dfast/wxdfast_0.6.0.tar.gz)
noextract=()
md5sums=('05c2a71cc8f811d1ad5916fce29b7b3a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

