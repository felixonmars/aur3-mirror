# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# vim:set ts=2 sw=2 et:
# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
pkgname=hla
pkgver=2.16
pkgrel=4
pkgdesc="The high level assembly language as used in the Art of Assembler book by Randy Hyde"
url="http://www.plantation-productions.com/Webster/"
arch=('i686' 'x86_64')
license=('unkown')
depends=(binutils)
makedepends=(binutils flex bison gcc)
conflicts=()
replaces=()
backup=()
install=
source=("${url}/HighLevelAsm/HLAv${pkgver}/linux.hla.tar.gz"
        'hla.sh')
md5sums=('b21999432dba1583508036878325a65e'
         '86e54485cbbd55362d59de4f0a7c352a')

package() { 
  cd $srcdir/usr/hla
  install -D -m755 hla "${pkgdir}/usr/bin/hla"
  install -D -m755 hlacmp "${pkgdir}/usr/bin/hlacmp"
  install -D -m755 hlaparse "${pkgdir}/usr/bin/hlaparse"
  install -D -m755 delete "${pkgdir}/usr/bin/delete"
  cd hlalib
  install  -m755 -D hlalib.a "${pkgdir}/usr/lib/hlalib.a"
  install  -m755 -D hlalib_safe.a "${pkgdir}/usr/lib/hlalib_safe.a"
  cd ../include
  find ./ -name "*.hhf" -exec install -D -m555 {} "${pkgdir}/usr/include/{}" \;
  install -D -m755 $srcdir/hla.sh "${pkgdir}/etc/profile.d/hla.sh"
}

