# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasia@siasia>
pkgname=ergo-emacs
_srcname=ergoemacs
pkgver=1.9.3.1
pkgrel=1 
pkgdesc="A fantastic text editor"
url="http://ergoemacs.org/"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=ergo-emacs.install
source=(http://ergoemacs.googlecode.com/files/${_srcname}_$pkgver.zip)
md5sums=('da70c04bf4f4c69850746e3a193e7bf1')
build() {
	install -d $pkgdir/usr/share/emacs/${_srcname}
	cd $srcdir/${_srcname}_$pkgver
	find -type f -exec install -m644 -D $srcdir/${_srcname}_$pkgver/{} $pkgdir/usr/share/emacs/${_srcname}/{} \;

	emacs -batch --script $pkgdir/usr/share/emacs/${_srcname}/build-util/byte-compile_lisp_files.el
}