# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=gemini-terminal
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal manager in the DWM style written in Vala."
arch=(i686 x86_64)
license=('LGPL')
url="https://github.com/lovebug356/gemini"
depends=('vte' 'libgee')
makedepends=('git' 'pkg-config' 'vala')
options=('!libtool')

build() {
  cd $srcdir
  rm -rf gemini
  git clone git://github.com/lovebug356/gemini.git
  cd gemini
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON
  make
}

package() {
  cd $srcdir/gemini
  make DESTDIR=$pkgdir install
}
