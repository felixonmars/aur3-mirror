# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Paulo Freire <paulofreire gmail com>
pkgname=datakiosk
pkgver=0.7
pkgrel=1
pkgdesc="DataKiosk is a JuK-like database interface tool for generic SQL databases"
arch=(i686)
url="http://extragear.kde.org/apps/datakiosk/"
license=('GPL')
groups=()
depends=('kdelibs' 'qt3')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://web.mit.edu/~treat/Public/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('44e02d025f663c82103abb82b631fe45')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
