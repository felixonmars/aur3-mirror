# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Michael Manley <mmanley@nasutek.com>
pkgname=edlin  
pkgver=2.15
pkgrel=1 
pkgdesc="Edlin is a line editor, which was included in MS-DOS."
url="http://sourceforge.net/projects/freedos-edlin/"
arch=('i686' 'x86_64')
license=('GPL')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/freedos-${pkgname}/files/freedos-${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download)
md5sums=('b2b72938af0ed2acdcc9af3c479c680c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install
}
