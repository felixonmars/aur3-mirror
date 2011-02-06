# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <tealeg@member.fsf.org>
pkgname=ikarus-tiny-talk  
pkgver=bzr
pkgrel=2 
pkgdesc="TinyTalk, a flexible object system for Scheme"
url="https://launchpad.net/kend"
arch=('i686')
license=('GPL')
depends=('ikarus>=0.0.3-3')
makedepends=('ikarus>=0.0.3-3' 'bzr')
conflicts=()
replaces=()
backup=()
install=
source=()
md5sums=()
build() {
  echo -n "Pulling source from launchpad ..."
  bzr checkout --lightweight http://bazaar.launchpad.net/~ken-dickey/kend/tiny-talk 
  find ./ -name ".bzr" -exec rm -rf {} \; &> /dev/null
  mkdir -p $startdir/pkg/usr/lib/ikarus/site-scheme/
  cp -r tiny-talk  $startdir/pkg/usr/lib/ikarus/
}