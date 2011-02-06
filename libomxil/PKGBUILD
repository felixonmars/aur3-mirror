# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libomxil
pkgver=0.2
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API"
arch=('i686' 'x86_64')
url="http://omxil.sourceforge.net"
license="LGPL"
options=('NOLIBTOOL')
depends=('ffmpeg')
source=(http://dl.sourceforge.net/sourceforge/omxil/libomxil-$pkgver.tar.gz)
md5sums=('6a7ed35b18d81a89dc425b7daff87326')

build() {
  cd $startdir/src/libomxil-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
