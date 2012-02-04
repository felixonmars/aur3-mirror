# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoff Teale <tealeg@member.fsf.org>
pkgname=r6rs-docs  
pkgver=1
pkgrel=4
pkgdesc="Documentation, in various formats for the Revised, Revised, Revised, Revised, Revised, Revised Report on the algorithmic language Scheme (R6RS)."
url="http://www.r6rs.org/"
arch=('i686')
license=('custom:public-domain')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("$url/final/r6rs.tar.gz")
md5sums=('786d0ab5dd6f56f1d907bfe7308efd4b')
build() {
  cd $startdir/src/
  rm -rf src/r6rs/document
  mkdir -p $startdir/pkg/usr/share/docs/
  find ./r6rs -type d -exec install -m 755 -d {} $startdir/pkg/usr/share/docs/{} \;
  find ./r6rs -type f -exec install -m 764 {} $startdir/pkg/usr/share/docs/{} \;
}