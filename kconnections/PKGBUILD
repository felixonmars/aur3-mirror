# Contributor: shamrok <szamrok@gmail.com>

pkgname=kconnections
pkgver=0.4.0
pkgrel=1
pkgdesc="Small wrapper for netstat for KDE"
arch=('i686' 'x86_64')
url="http://ksquirrel.sourceforge.net/subprojects.php"
license=('GPL')
depends=('kdelibs')
source=("http://downloads.sourceforge.net/ksquirrel/$pkgname-$pkgver.tar.bz2")
md5sums=('7c891b9e26d86853798c9bc08ba5a050')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
