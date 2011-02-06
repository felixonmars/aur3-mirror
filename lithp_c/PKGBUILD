# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=lithp_c  
pkgver=0.6
pkgrel=2 
pkgdesc="A portable lisp, C src code is extracted from the noweb files"
url="http://www.umlautllama.com/projects/lithp"
arch=(`arch`)
license=('LGPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(lithp.sh)
md5sums=('a6a609cf320f36f4b56b6f6e2cd11e8c')
build() {
  cd $startdir/src/
  sh lithp.sh
  cd $startdir/src/c/c_src
  make || return 1
  install -Dm755 lithp $pkgdir/usr/bin/lithp
  mkdir -p $pkgdir/usr/share/lithp/
  cd ../
  cp -a samples doc $pkgdir/usr/share/lithp/
  cd doc
  cp LICENSE README $pkgdir/usr/share/lithp/
}