# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Paulo Freire <paulofreire gmail com>
pkgname=datakiosk-i18n
pkgver=0.7
pkgrel=1
pkgdesc="Language packs for DataKiosk"
arch=(i686)
url="http://extragear.kde.org/apps/datakiosk/"
license=('GPL')
groups=()
depends=('kdelibs' 'qt3' 'datakiosk')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://web.mit.edu/~treat/Public/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('78dd88d006aed18426af87c345c21409')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
