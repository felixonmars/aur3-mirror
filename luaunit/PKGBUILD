# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=luaunit  
pkgver=1.3
_pkgver=v13
pkgrel=1 
pkgdesc="Unit testing for lua"
url="http://phil.freehackers.org/programs/luaunit/"
arch=(`arch`)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://luaforge.net/frs/download.php/2689/${pkgname}-${_pkgver}.tar.gz)
md5sums=('b98013a98c896c01a696a0f1923e8c96')

build() {
  cd $startdir/src/${pkgname}_${_pkgver}
#luaunit_v13
  echo path = ${pkgname}_${_pkgver}
  install -m755 -d $pkgdir/usr/share/lua/5.1
  install -m755 -t $pkgdir/usr/share/lua/5.1 luaunit.lua 
}