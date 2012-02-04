# Maintainer: TryA <tryagainprod@gmail.com>

pkgname=gens
pkgver=2.15.5
pkgrel=5
pkgdesc='An emulator of Sega Genesis, Sega CD and 32X, built from the official Gens for Linux tree'
url='http://gens.sourceforge.net'
license=('GPL')
arch=('i686' 'x86_64')
if [[ $CARCH == "x86_64" ]]; then
  depends=('lib32-gtk2' 'lib32-sdl' 'lib32-libgl')
  makedepends=('nasm' 'gcc-multilib')
else
  depends=('gtk2' 'sdl' 'libgl')
  makedepends=('nasm')
fi
conflicts=('gens-gs' 'bin32-gens' 'bin32-gens-gs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        gens.desktop)
md5sums=('1496a49be056d65bf76b52de62e932d7'
         '99796e505b58f08a0930e61e6a5f23f9')

build() {
  if [ $CARCH == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
  fi
  
  unset CFLAGS
  unset LDFLAGS  
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/gens.desktop \
    ${pkgdir}/usr/share/applications/gens.desktop
}
