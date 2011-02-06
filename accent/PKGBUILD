# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=accent
pkgver=1.0
pkgrel=1 
pkgdesc="A Compiler Compiler for the Entire Class of Context-Free Languages."
url="http://accent.compilertools.net/accent.tar"
arch=(`arch`)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://accent.compilertools.net/$pkgname.tar
accent.patch)
md5sums=('70b8091b7924ee73ee330c4a618fe31d'
         '598e76c266f353d4ac4e65d90800a031')
build() {
  cd $startdir/src/$pkgname
  patch -p1 < $startdir/accent.patch
  cd $pkgname
  ./build || return 1
  install -m755 -d $pkgdir/usr/bin $pkgdir/usr/share/accent
  install -m755 -t $pkgdir/usr/bin accent
  install -m755 -t $pkgdir/usr/share/accent ../entire/entire.c
  install -m755 -t $pkgdir/usr/share/accent ../amber/amber.c
}