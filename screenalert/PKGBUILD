# Contributor: Tomas Kopecny <georgo10 at gmail.com>

pkgname=screenalert
pkgver=0.1
pkgrel=2
pkgdesc="Screenalert, are notifications windows styled, every user/program can send an alert on your display."
url="http://sourceforge.net/projects/screenalert/"
arch=('i686')
depends=('gtk2')
source=(http://ignum.dl.sourceforge.net/project/screenalert/ScreenAlert/0.1%20-%20beta/$pkgname-$pkgver.tar.bz2)
license=('GLP')
md5sums=('8348e0951c43a2e15278b8e2a5f294b9')

build() {
 cd $startdir/src/$pkgname-$pkgver
 ./configure --prefix=/usr
 make || return 1
 make prefix=$startdir/pkg/usr install
} 
