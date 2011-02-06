# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=libinstrudeo
pkgver=0.1.4
pkgrel=2
pkgdesc="Library that provides the necessary logic to capture and process screen recordings"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/libinstrudeo/"
license="GPL"
depends=('curl' 'ffmpeg' 'freeglut' 'libdc1394' 'libgl' 'libtheora' 'libxml++2')
makedepends=('ftgl' 'gsm')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('90fad6e48c65c132e700a21f12e64ef1')
options=(NOLIBTOOL)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/usr --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
