# Manteiner: Sky_Walker <omarbotta@gnulinuxlibre.net>
pkgname=prozilla-venenux
pkgver=2.0.4
pkgrel=2
pkgdesc="A multi-threaded download accelerator,this version has been optimized by Victor Diaz Devera for VENENUX GNU/Linux"
url="http://www.venenux.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('bison' 'gettext' 'pkgconfig')
options=('!libtool')
source=(http://www.venenux.org/repos/venenux/pool/principal/p/prozilla-venenux/prozilla-venenux_2.0.4-1.1.tar.gz)
md5sums=('a21162ed7934c38d7ee9b3d173770f37')

build() {
  cd "$srcdir/prozilla-venenux"
  sed -i 's/DL_Window:://' src/download_win.h
  ./configure --prefix=/usr --mandir=/usr/share/man \
      --enable-shared --disable-static || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
