# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=emacs-ace-jump-mode
pkgver=0.1
pkgrel=1 
pkgdesc="Minor mode for Emacs, enabling fast/direct cursor-moving in current view."
url="https://github.com/winterTTr/ace-jump-mode"
arch=('any')
license=('GPL')
depends=('emacs')
install=ace-jump-mode.install
source=('https://raw.github.com/winterTTr/ace-jump-mode/master/ace-jump-mode.el')
md5sums=('272baf0cc8ea96c40ea42523f13edc40')
build() {
  install -D -m644 "${srcdir}"/ace-jump-mode.el "${pkgdir}/usr/share/emacs/site-lisp/ace-jump-mode.el" || return 1
}