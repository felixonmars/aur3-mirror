# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Grigorios Bouzakis <grbzks@gmail.com>
pkgname=fm
pkgver=1.1
pkgrel=3
pkgdesc="Fast Move: minimalistic ncurses file system viewer"
arch=('i686' 'x86_64')
url="http://server01.iiiii.info/fm.html"
license=('GPL3')
#depends=('glib2' 'ncurses' 'ctags')
depends=('glib2' 'ncurses')
#source=($pkgname-$pkgver.tar.gz::http://server01.iiiii.info/public/$pkgname-$pkgver.tar.gz)
source=("http://server01.iiiii.info/public/$pkgname.tar.gz")
md5sums=('e393e0655ea341ad8158d8de41bb6e52')

build() {
  cd $srcdir/$pkgname
  sed -i 's+vim+vi+' fm.h || return 1
  make PREFIX=$pkgdir/usr install || return 1
}
