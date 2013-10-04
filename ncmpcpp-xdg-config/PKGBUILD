pkgname=ncmpcpp-xdg-config
_pkgname=ncmpcpp
pkgver=0.5.10
pkgrel=4
pkgdesc="Almost exact clone of ncmpc with some new features. Stable version patched to use XDG_CONFIG_HOME" 
arch=('i686' 'x86_64' 'armv6h')
url='http://ncmpcpp.rybczak.net/'
license=('GPL')
depends=('curl' 'libmpdclient' 'taglib' 'ncurses' 'fftw')
conflicts=('ncmpcpp')
install=ncmpcpp.install
source=("http://ncmpcpp.rybczak.net/stable/ncmpcpp-$pkgver.tar.bz2"
	"xdg.patch")
md5sums=('298ed66325bcfe358e37e186c7ea4861'
	 'f1327dc93c389a757b43290e993050c5')

build() {
  cd $srcdir/${_pkgname}-$pkgver

  msg "Patching"
  patch -p1 -i $srcdir/xdg.patch

  ./configure --prefix=/usr    \
              --enable-clock   \
              --enable-outputs \
              --enable-unicode \
              --enable-visualizer \
              --with-curl      \
              --with-fftw      \
              --with-taglib
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  make DESTDIR=$pkgdir install

  make -C extras/
  install -Dm755 extras/artist_to_albumartist $pkgdir/usr/bin/
}
