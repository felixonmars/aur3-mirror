# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname="dirac-codec"
pkgver="1.0.2"
pkgrel=2
pkgdesc="An open source video codec."
arch=("i686" "x86_64")
url="http://diracvideo.org/"
license=('MPL')
makedepends=('autoconf' 'doxygen')
source=(http://diracvideo.org/download/dirac-research/dirac-$pkgver.tar.gz)
md5sums=('a57c2c5e58062d437d9ab13dffb28f0f')

build() {
  cd $srcdir/dirac-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}




