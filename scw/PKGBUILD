# Maintainer: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=scw
pkgver=0.4.7
pkgrel=1
pkgdesc="Widget set specifically designed for chat programs"
arch=('i686' 'x86_64')
url="http://scwwidgets.googlepages.com/"
options=('NOLIBTOOL')
license="LGPL"
depends=('gtk2')
makedepends=('pkgconfig')
source=(http://scwwidgets.googlepages.com/$pkgname-$pkgver.tar.gz)
md5sums=('f244d8fa5526ad40374f14b3f91de0f3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
