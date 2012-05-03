# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=emacs-groovy-mode  
pkgver=20110629
_pkgver=2011-06-29
pkgrel=1 
pkgdesc="Emacs major mode for the Groovy programming language"
url="https://launchpad.net/groovy-emacs-mode"
arch=('i686' 'x86_64')
license=('GPL')
depends=('emacs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=emacs-groovy-mode.install
source=(https://launchpad.net/groovy-emacs-mode/trunk/current-release/+download/${pkgname}_$_pkgver.tgz)
md5sums=('5abaad97c592759552154853937bf97a')
build() {
	mkdir -p $pkgdir/usr/share/emacs/site-lisp/groovy-mode
	install -Dm644 *.el README $pkgdir/usr/share/emacs/site-lisp/groovy-mode
}