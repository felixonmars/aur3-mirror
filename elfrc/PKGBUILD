# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=elfrc
pkgver=0.7
pkgrel=1
pkgdesc="A program which can turn arbitrary files into ELF object files."
arch=('i686' 'x86_64')
url="http://ktown.kde.org/~frerich/elfrc-0.7.tar.gz"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ktown.kde.org/~frerich/$pkgname-$pkgver.tar.gz
        silence-pointless-error.patch)
noextract=()
md5sums=('397c26285bd153808d651fd2877e2ed7'
         'ae9ae6f2337db9c3a6701f023ba4ea41')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 < ../silence-pointless-error.patch

  make || return 1
  
  mkdir -p $pkgdir/usr/bin
  cp elfrc $pkgdir/usr/bin
}

