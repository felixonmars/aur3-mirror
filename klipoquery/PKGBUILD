pkgname=klipoquery
pkgver=0.2.4
pkgrel=1
pkgdesc="The KlipOQuery-Panelapplet for KDE is meant to be a bridge between Klipper and the Web."
url="http://www.michael-vonrueden.de/klipoquery/"
license=""
depends=('kdebase>=3.3.0' 'kdelibs>=3.3.0')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
#source=($pkgname-$pkgver.tar.gz)
source=(http://www.michael-vonrueden.de/klipoquery/$pkgname-$pkgver.tar.gz)
md5sums=(e2866389931925b81eb1f907cc7ff6d4)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
