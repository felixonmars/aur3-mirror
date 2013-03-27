# Maintainer: Taylor Venable <taylor@metasyntax.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dtw <dibble.at.thewrecker.dot.net>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
# Upgrade to ver. 1.8 - Pawel Bogur <jid:smeagol@uaznia.net>

pkgname=tcllib-critcl
pkgver=1.15
pkgrel=2
pkgdesc="Set of pure-Tcl extensions with native support (aka tcllibc) via Critcl"
arch=('any')
url="http://tcllib.sourceforge.net/"
license=('bsd')
depends=('tcl')
provides=('tcllib')
conflicts=('tcllib')
source=(http://downloads.sourceforge.net/sourceforge/tcllib/tcllib-${pkgver}.tar.gz)
md5sums=('7a0525912e8863f8d4360ab10e5450f8')

package(){
  cd ${srcdir}/tcllib-${pkgver}

  sed -i 's|package require TclOO 0.6.1|package require TclOO 1.0|' \
	modules/struct/stack_oo.tcl \
	modules/struct/queue_oo.tcl

  _PREFIX=${pkgdir}
  _TCLSH="/usr/bin/tclsh"
  $_TCLSH `echo installer.tcl` -pkg-path $_PREFIX/usr/lib/tcllib \
	-app-path $_PREFIX/usr/bin \
	-nroff-path $_PREFIX/usr/share/man/mann \
	-no-examples -no-html \
	-no-wait  -no-gui
  $_TCLSH `echo sak.tcl` critcl
  cp -R ${srcdir}/tcllib-${pkgver}/modules/tcllibc ${pkgdir}/usr/lib/tcllib
  mkdir -p ${pkgdir}/usr/share/licenses/tcllib/
  cp ${srcdir}/tcllib-${pkgver}/license.terms ${pkgdir}/usr/share/licenses/tcllib/COPYING
  rm -f $pkgdir/usr/share/man/mann/{try,string,variable,zlib}.n
}
