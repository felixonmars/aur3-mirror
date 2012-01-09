# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=emacs-rainbow-mode
pkgver=0.2
pkgrel=1 
pkgdesc="This minor mode sets background color to strings that match color names, e.g. #0000ff is displayed in white with a blue background."
url="http://julien.danjou.info/software/rainbow-mode"
arch=('any')
license=('GPL')
depends=('emacs')
install=emacs-rainbow-mode.install
source=("http://bzr.savannah.gnu.org/lh/emacs/elpa/download/julien%40danjou.info-20110923170024-9kdfgm0m753yf06b/rainbowmode0.1.el-20101118182351-xme90jru269t6msr-12/rainbow-mode.el")
md5sums=('e94eace81aabf4bdc381800e4d511820')
build() {
  install -D -m644 "${srcdir}"/rainbow-mode.el "${pkgdir}/usr/share/emacs/site-lisp/rainbow-mode.el" || return 1
}