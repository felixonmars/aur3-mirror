# Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=ksystemlog
pkgver=0.3.2
pkgrel=1
pkgdesc="KSystemLog is a system log viewer tool for KDE 3.4."
url="http://annivernet.free.fr/ksystemlog/"
license="GPL"
depends=('kdelibs' 'xorg')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://annivernet.free.fr/ksystemlog/archives/src/$pkgname-$pkgver.tar.bz2)
md5sums=('ca98b571202b6f18a9294face233b9f0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}