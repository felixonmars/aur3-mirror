# Maintainer: yafengabc <yafengabc@gmail.com>

pkgname=mvgather
pkgver=3.0.0
pkgrel=1
pkgdesc="MvGather 影视集结号，看电影看电视的软件"
arch=('i686' 'x86_64')
url="http://github.com/xsjqqq123"
license=('LGPL')
depends=('qt5-base' 'qtav-git')
makedepends=('git')
conflicts=("$pkgname")
provides=("$pkgname")
source=("git://github.com/xsjqqq123/$pkgname" "share.tar.gz")
install=$pkgname.install


build() {
  cd $pkgname
  qmake -o Makefile MvGather.pro 
  sed -i 's/Qt5AV/QtAV/g' Makefile
  make
}

package() {
  	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	cp $pkgname/MvGather  $pkgdir/usr/bin
	cp -a share $pkgdir/usr/
}
sha256sums=('SKIP'
            '81d568f1c142bdc4518659f019052479cc0aa7eadf118f1f131d776f5834d6d6')
