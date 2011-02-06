# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=xrtti
pkgver=0.4
pkgrel=1
pkgdesc="eXtended RunTime Type Information for C++"
arch=('i686' 'x86_64')
url="http://www.ischo.com/xrtti"
license=('GPL')
groups=()
depends=('expat' 'gccxml')
makedepends=('make' 'expat' 'doxygen')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.ischo.com/xrtti/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('5586f6ad08afd9d4582c281db9eb7fe5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR=$pkgdir/usr make install || return 1
}

# vim:set ts=2 sw=2 et:

