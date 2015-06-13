# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk

pkgname=jedmodes  
pkgver=2.5.7
pkgrel=1 
pkgdesc="Repository of modes for jed editor"
url="http://jedmodes.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('jed')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=( http://nchc.dl.sourceforge.net/project/jedmodes/$pkgname-$pkgver.tgz) 

package() {
  cd $startdir/src/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/share/jed/lib
  cp -a * $pkgdir/usr/share/jed/lib
  cd $pkgdir/usr/share/jed/lib
  rm C* README*
}
md5sums=('b7e40de38d3436d5cf6f56056cf0b524')
