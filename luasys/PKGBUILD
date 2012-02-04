# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=luasys  
pkgver=1.8
pkgrel=1 
pkgdesc="Unix/Linux system API for lua"
url="http://luaforge.net/projects/luasys/"
arch=(`arch`)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://luaforge.net/frs/download.php/4492/$pkgname-$pkgver.tar.gz Makefile.patch)
md5sums=('820fdb910470e18d1a00a9496ed2a223'
         '67d5d0e2dd04195817799ae7c34debba')
build() {
  cd $startdir/src/$pkgname/src
  patch -p1 Makefile < ${startdir}/Makefile.patch
  make linux || return 1
  install -m755 -d $pkgdir/usr/lib/lua/5.1
  install -m755 -t $pkgdir/usr/lib/lua/5.1 sys.so
}