# Maintainer: ezzetabi <ezzetabi@gawab.com>
pkgname=mygestures
pkgver=0.5_4
pkgrel=1
epoch=
pkgdesc="Recognize mouse gestures to perform window sensitive actions"
arch=(x86_64 i686)
url="http://sourceforge.net/projects/mygestures/"
license=('GPL')
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
source=(http://sourceforge.net/projects/mygestures/files/mygestures/"${pkgver//_/-}"/mygestures"${pkgver//_/-}"-src.tar.gz)
noextract=()

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir"
  install -m755 -d etc
  install -m644 "$srcdir/$pkgname/gestures" etc
}

md5sums=('5f8980729128ce745c03f6e560d82890')
# vim:set ts=2 sw=2 et:
