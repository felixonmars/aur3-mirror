# Contributor Zachary Miscikoski  <ninjazach@gmail.com>

pkgname=zinc
pkgver=1.1.8
pkgrel=3
pkgdesc="A command line Yahoo! chat client written in Python."
depends=('python' 'ncurses')
source=(http://larvalstage.com/zinc/files/$pkgname-$pkgver.tar.gz)
license=('GPL')
arch=('x86')
url="http://larvalstage.com/zinc/"
md5sums='2913b875f3b8f98f31fe24140334057e'

build() {
  
  cd $startdir/src/$pkgname-$pkgver/
  mkdir -p $startdir/pkg/usr/bin/
  sh install.sh --prefix=$startdir/pkg/usr
}
