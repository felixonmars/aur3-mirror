#Contributor: Todd Maynard <arch@toddmaynard.com>
pkgname=kuote
pkgver=0.9.3
pkgrel=1
pkgdesc="KDE Applet - fortune frontend"
url="http://hektor.umcs.lublin.pl/~mikosmul/computing/kuote-fortune-fish-applet.html"
license=""
depends=(kdelibs fortune-mod)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://hektor.umcs.lublin.pl/~mikosmul/computing/$pkgname-$pkgver.tar.bz2)
md5sums=('6bff850c45e2d764e6ceba03bf683317')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
