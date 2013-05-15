# Maintainer: Alessandro "jakedust" Andrioni <jakedust@gmail.com> 
# Based on the mpir PKGBUILD by remyoudompheng

pkgname=mpir-git
_gitname=mpir
pkgver=2.6.0.37.g95bdc34
pkgrel=1
pkgdesc="Library for multiple precision integers and rationals"
arch=('i686' 'x86_64')
url="https://github.com/wbhart/mpir"
license=('LPGL')
depends=('gmp' 'gcc-libs')
conflicts=('mpir'
	   'yasm')
provides=('mpir'
	  'yasm=1.2')
source=('git://github.com/wbhart/mpir.git'
        '0001-t-scan.patch')
md5sums=('SKIP'
         'cf050a607d0395579d6bd9ab68f4db35')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g;s/mpir.//'
}

build() {
  cd $_gitname
  git apply "$srcdir/0001-t-scan.patch"
  [[ "$CARCH" == "i686" ]] && export ABI=32
  ./configure --prefix=/usr --enable-cxx 
  make
}

check() {
  cd $_gitname
  make check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
