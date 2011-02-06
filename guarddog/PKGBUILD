# Contributor: Abaddon <kukububu@go2.pl>

pkgname=guarddog
pkgver=2.6.0
pkgrel=3
pkgdesc="A firewall configuration utility for Linux systems."
arch=(i686 x86_64)
url="http://www.simonzone.com/software/guarddog/"
license=('GPL')
depends=('kdelibs3' 'iptables' 'gawk' 'xorg-server' 'qt3')
source=(http://www.simonzone.com/software/guarddog/$pkgname-$pkgver.tar.gz)
md5sums=('a1535c4e3f668ea1de5a12f671e7af13')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-debug \
    --with-qt-dir=/opt/qt \
    --with-extra-includes=/opt/kde/include \
    --without-arts
  make || return 1
  make prefix=$pkgdir/usr install
}
