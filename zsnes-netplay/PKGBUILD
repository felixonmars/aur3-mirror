# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=zsnes-netplay
_pkgname=zsnes
pkgver=1.42n
pkgrel=3
pkgdesc="Super Nintendo emulator (latest version supporting netplay)"
url="http://zsnes.com"
arch=('i686' 'x86_64')
license=('GPL')
options=(!buildflags)
if [[ $CARCH == "x86_64" ]]; then
  depends=('gcc-libs-multilib' 'lib32-sdl' 'lib32-libpng>=1.5.0' 
    'lib32-libgl' 'lib32-ncurses' 'lib32-mesa')
  makedepends=('nasm' 'gcc-multilib')
else
  depends=('sdl' 'libpng>=1.5.0' 'mesa')
  makedepends=('nasm' 'gcc')
fi
source=(http://snesemu.black-ship.net/emus/zsnes/zsnesnet.tar.bz2
        custompath.patch
        libpng.patch
        $pkgname.desktop)
md5sums=('890fa9174edb127b1a3e7607258db32d'
         'b95a1db0d50aafce6a2137b999c87155'
         'f7366961f21ed63d0844a3a6d4780bcf'
         'd6e6f1ebe84bc743dd940a65a7485f57')

build() {
  cd "$srcdir"

  patch -Np1 -i "$srcdir"/custompath.patch
  patch -Np1 -i "$srcdir"/libpng.patch

  if [ $CARCH == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
  fi

  chmod +x autogen.sh

  ./autogen.sh --prefix=/usr x_libraries=/usr/lib force_arch=i686 \
    --enable-release --enable-debug

  make
}

package() {
  cd "$srcdir"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/icons/48x48x32.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  
}
