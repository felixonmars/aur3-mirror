# Maintainer: bl00drav3n <bl00d_rav3n at gmx dot net>

pkgname=zsnes-1-42
_pkgname=zsnes
pkgver=1
pkgrel=1
pkgdesc="Super Nintendo emulator"
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
source=(http://prdownloads.sourceforge.net/zsnes/zsnes142src.tar.gz
        arch.patch
        $pkgname.desktop)
md5sums=('e3fcc13061e169194ec31c27ace1b6e7'
         '1cff99c9b9e5a97466ff185e7c168508'
         '4092eb289a93fb71dd8b9278b599fa6c')

build() {
  cd "$srcdir"
  cp -r "$srcdir"/zsnes_1_42/src/* .

  patch -Np1 -i "$srcdir"/arch.patch

  if [ $CARCH == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
  fi

  chmod +x autogen.sh

  ./autogen.sh --prefix=/usr x_libraries=/usr/lib force_arch=i686

  make
}

package() {
  cd "$srcdir"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/icons/48x48x32.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  
}
