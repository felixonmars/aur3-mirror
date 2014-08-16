# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=random-wordlist-generator
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple tool to generate random words using different sets of characters."
arch=('i686' 'x86_64')
url=("http://random-wordlist-generator.sourceforge.net")
license=('GPL3')
depends=('qt5-base')
if test "$CARCH" == x86_64; then
  depends+=('gcc-libs-multilib')
fi
makedepends=('cmake')
source=("http://sourceforge.net/projects/random-wordlist-generator/files/Random%20Wordlist%20Generator/0.2/RandomWordlistGenerator-${pkgver}.tar.bz2")
md5sums=('c636ed94fdb8cb6d33680cd6218b7df1')

prepare() {
  if [[ -d build ]]
  then
    rm -rf build
  fi
    mkdir build
  sed -i 's;Other;Utility;g' RandomWordlistGenerator-${pkgver}/res/randomwordlistgenerator.desktop
}

build() {
  cd build
  cmake ../RandomWordlistGenerator-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
