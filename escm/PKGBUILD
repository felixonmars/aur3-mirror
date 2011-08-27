# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=escm  
pkgver=1.1
pkgrel=1 
pkgdesc="escm is a filter program which takes a text with embedded Scheme exressions, copies it to the output with evaluating the Scheme expressions." 
url="http://www.shiro.dreamhost.com/scheme/vault/escm.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://www.shiro.dreamhost.com/scheme/vault/escm-1.1.tar.gz")
md5sums=('a434672b3be25528f9e6a2781faffd02')
build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  make || return 1

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man1
	install -m755 escm $pkgdir/usr/bin
	install -m755 escm.1 $pkgdir/usr/share/man/man1
}
