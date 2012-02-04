# Maintainer: Stefan.Husmann <Stefan.Husmann@t-systems.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=sage
pkgver=0.2.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="An OpenGL extensions library using SDL"
url="http://worldforge.org/dev/eng/libraries/sage"
license=('LGPL')
depends=('sdl' 'mesa' 'libgl')
source=(http://downloads.sourceforge.net/sourceforge/worldforge/$pkgname-$pkgver.tar.gz)
md5sums=('fbeb372c8096ea9cbdeb5152900bb313')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  rm -r $startdir/pkg/usr/bin
}
