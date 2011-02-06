# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=aescm  
pkgver=0.32
pkgrel=2 
pkgdesc="aescm is a text file processor that expands embedded Scheme expressions in the input file. Unlike other text-embedded language processors, escm does not depend on a particular Scheme implementation---you can use your favorite Scheme." 
url="http://www.shiro.dreamhost.com/scheme/vault/escm.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=( "http://nchc.dl.sourceforge.net/project/escm/aescm/0.32/aescm-0.32.tar.gz")
build() {
  cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
  make || return 1

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man1
	install -m755 src/$pkgname $pkgdir/usr/bin
	install -m755 $pkgname.1 $pkgdir/usr/share/man/man1
}
md5sums=('c9976a6d71571432c2b133d6a4d3d653')
