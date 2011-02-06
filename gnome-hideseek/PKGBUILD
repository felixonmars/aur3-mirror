# Contributor: eKoeS <my.ekoes@gmail.com>

pkgname=gnome-hideseek
pkgver=0.6.0
pkgrel=1
pkgdesc="This utility finds GNOME hidden preferences stored in GConf and groups all together in a better user interface."
arch=('i686' 'x86_64')
url="http://hideseek.sourceforge.net/"
license=('GPL')
depends=('gnome-desktop' 'gconf')
source=(http://dl.sourceforge.net/sourceforge/hideseek/$pkgname-$pkgver.tar.gz)
md5sums=('28a38de5121d7e4d7a63465f79ee29fc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
