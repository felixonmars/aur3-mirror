# Contributor: Sergey Malkin <adresatt.at.rambler.ru>

pkgname=metromap
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple pygtk+2 programm for finding paths in subway maps"
url="http://metromap.antex.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pygtk')
source=("http://metromap.antex.ru/$pkgname-$pkgver.tar.bz2")
md5sums=('23aeab972224456a0a54675abab0a4ad')

build() {
   cd $startdir/src/$pkgname-$pkgver
   make DESTDIR=$startdir/pkg install || return 1
}
