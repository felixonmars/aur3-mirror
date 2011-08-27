# $Id$
# Maintainer:  <wamba@centrum.cz>
pkgname=ispell-czech
pkgver=20040229
pkgrel=1
pkgdesc="Czech dictionary for ispell."
url="ftp://ftp.vslib.cz/pub/unix/ispell/"
license=""
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.vslib.cz/pub/unix/ispell/$pkgname-$pkgver.tar.gz)
md5sums=('60d5cc92808eb09f764d900c680a9bff')

build() {
  cd $startdir/src/$pkgname
 # ./configure --prefix=/usr
  make || return 1
  make TOPDIR=$startdir/pkg install
}