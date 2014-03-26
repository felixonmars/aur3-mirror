# Maintainer: Rasmus <rasmus@gmx.us>
pkgname=gambit-git
pkgver=v14.0.1.r30.g5b70faf
pkgrel=1
pkgdesc="Software Tools for Game Theory. Git version"
arch=('i686' 'x86_64')
url="https://github.com/gambitproject/"
license=('GPL')
depends=('wxgtk2.8')
source=()
_gitroot=git://github.com/gambitproject/gambit.git
source=("$pkgname::$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  if test "$CARCH" == x86_64; then
      ./configure --disable-enumpoly --with-wx-prefix=/usr/include/wx-2.8 --with-wxdir=/usr/include/wx-2.8  --prefix=/usr
  else
    ./configure --with-wx-prefix=/usr/include/wx-2.8 --prefix=/usr
  fi
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
