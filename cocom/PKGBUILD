# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=cocom 
pkgver=0.996
pkgrel=1
pkgdesc="COCOM, a tool set oriented to the creation of compilers, cross-compilers, interpreters, and other language processors. The distribution also contains interpreter of language DINO as an example of the tool set usage. The tool set is aimed to use on Unixes of different flavors. In ANSI C."
url="http://cocom.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://prdownloads.sourceforge.net/cocom/cocom-0.996.tar.gz)
md5sums=('c95c5504fd76f4e05c4155ed840cc756')
build() {
  cd $startdir/src/$pkgname-$pkgver
	mv REGEX .REGEX
	./configure --prefix=/usr
	mv .REGEX REGEX
	cd REGEX
	./configure --prefix=/usr
	echo '\\end'|make
	cd ../
	make || return 1
  make DESTDIR=$startdir/pkg install
}
