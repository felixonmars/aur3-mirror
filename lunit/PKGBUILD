# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=lunit  
pkgver=0.5
pkgrel=1 
pkgdesc="unit test for lua"
url="http://www.nessie.de/mroth/lunit"
arch=(any)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.nessie.de/mroth/lunit/$pkgname-$pkgver.tar.gz)
md5sums=('83e7b6524165ca56f31aff84630ea58d')
build() {
	luaver=`lua -v | cut -d\  -f2|cut -c1-3`
  cd $startdir/src/$pkgname-$pkgver
  install -m755 -d "$pkgdir/usr/share/lua/$luaver" $pkgdir/usr/bin
  install -m755 -t "$pkgdir/usr/share/lua/$luaver" lunit-console.lua lunit.lua
  install -m755 -t  $pkgdir/usr/bin lunit
}
