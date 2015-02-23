# Maintainer: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=gnun
pkgver=0.9
pkgrel=1
pkgdesc="GNUnited Nations (GNUN) is a build system for www.gnu.org translations."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnun/"
license=('GPL')
depends=('make' 'sed' 'gettext' 'guile' 'awk' 'po4a'  'wdiff' 'libxml2' 'cvs')
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('079ef66f115ae33ee03bd51895c6f17f') # generate with 'makepkg -g'



build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
