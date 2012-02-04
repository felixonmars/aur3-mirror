# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=lithp  
pkgver=0.6
pkgrel=3 
pkgdesc="This is a basic, tiny LISP implementation."
url="http://www.umlautllama.com/projects/lithp/lithp-0.6.tar.gz"
arch=(`arch`)
license=('GPL')
depends=('noweb')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=($pkgname.sh
  make.patch)
md5sums=('5111a8458c70b95badf48f3f37b1c4fa'
         'a08b3e439801ceaac8a8227ca446a3a8')
build() {
  cd $startdir/src/
  sh $pkgname.sh
  cd $startdir/src/$pkgname
  patch GNUmakefile < $startdir/make.patch
  make || return 1
  make docs
  install -Dm755 lithp $pkgdir/usr/bin/lithp
  install -Dm755 LICENSE $pkgdir/usr/share/lithp/LICENSE
  install -D -m755 lithp.pdf README sample*lsp -t $pkgdir/usr/share/lithp/
}
