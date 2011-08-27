# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=lpty
pkgver=0.9
_pkgver=0.9-1
pkgrel=1 
pkgdesc="A simple facility for lua to control other programs via PTYs."
url="http://www.tset.de/lpty/"
arch=(`arch`)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.tset.de/downloads/$pkgname-${_pkgver}.tar.gz)
md5sums=('936be0bb1018de37370df9c32eebb8bb')
build() {
  cd $startdir/src/$pkgname-${_pkgver}
  make || return 1
  install -m755 -d $pkgdir/usr/lib/lua/5.1
  install -m755 -t $pkgdir/usr/lib/lua/5.1 lpty.so
}