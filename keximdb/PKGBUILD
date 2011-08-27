# Contributor: Simon Legner <simon.legner@gmail.com>
pkgname=keximdb
pkgver=1.0
pkgrel=1
pkgdesc="Plugin for Kexi to import Microsoft Access Databases (mdb)"
arch=('i686')
url="http://www.koffice.org/filters/1.5/kexi/mdb.php"
license=('GPL')
groups=()
depends=(koffice)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(ftp://ftp.kde.org/pub/kde/stable/apps/KDE3.x/database/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('6b9c70e5203187a14ec23e900ae8ad74')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$pkgdir/" install
}
