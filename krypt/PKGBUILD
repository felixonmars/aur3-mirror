# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=krypt
pkgver=0.2
pkgrel=2
pkgdesc="KDE3 utility for controlling LUKS encrypted volumes"
arch=('i686' 'x86_64')
url="http://krypt.berlios.de"
license=('GPL')
depends=('qt3' 'kdelibs3')
source=("http://download.berlios.de/krypt/krypt-0.2.tar.bz2")
md5sums=('9aba54a109ce09e0879d30ce93a4a134')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
