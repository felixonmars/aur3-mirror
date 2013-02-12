# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=converge
pkgver=2.0
pkgrel=1 
pkgdesc="Converge has syntax like Python. With modern and meta programming in mind."
url="http://convergepl.org/about.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pcre' 'ncurses' 'libxml2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=converge.install

if test "$CARCH" == "x86_64" ; then
	source=(http://convergepl.org/releases/$pkgver/converge-2.0_linux_x86_64.tar.bz2)
	md5sums=(ee8d99c5ac58a93bcfd3625f1fb336e4)  
else
	source=(http://convergepl.org/releases/$pkgver/converge-2.0_linux_x86.tar.bz2)
	md5sums=(709fba885a17e29fdb0ec120cbade112)  
fi

build() {
  cd $startdir/src/converge-$pkgver
	mkdir -p $pkgdir/usr/{bin,lib,share}
	cp -a * $pkgdir/usr
}
