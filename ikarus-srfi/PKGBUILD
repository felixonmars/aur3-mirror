# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <tealeg@member.fsf.org>
pkgname=ikarus-srfi  
pkgver=bzr
pkgrel=2
pkgdesc="A basic framework for SRFIs ported to R6RS."
url="https://code.launchpad.net/~ikarus-srfi-team/ikarus-libraries/srfi"
arch=('i686')
license=('GPL')
depends=('ikarus')
makedepends=('ikarus')
conflicts=()
replaces=()
backup=()
install=
source=()
md5sums=()
build() {
  echo -n "Pulling source from launchpad ..."
  bzr checkout --lightweight http://bazaar.launchpad.net/~ikarus-libraries-team/ikarus-libraries/srfi
  find ./ -name ".bzr" -exec rm -rf {} \; &> /dev/null
  mkdir -p $startdir/pkg/usr/lib/ikarus/xitomatl
  cp -r srfi $startdir/pkg/usr/lib/ikarus/xitomatl/

}