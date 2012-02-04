# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=spectmorph
pkgver=0.2.0
pkgrel=1
pkgdesc="A free software project which allows to analyze samples of musical instruments."
arch=('i686' 'x86_64')
url="http://www.$pkgname.org/"
license=('LGPL')
depends=('beast>=0.7.2' 'fftw' 'gtkmm' 'jack' 'libao')
options=('!libtool')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('6a31fe7329d7794b55fd8f2b48e3a983')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHON="python2"
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  # path fix
  sed -i "s_/local/beast__" beast/Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
