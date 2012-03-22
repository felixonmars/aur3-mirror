# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=emacs-ttl-mode
pkgver=0.2
pkgrel=1 
pkgdesc="This is an Emacs mode for editing Turtle (RDF) files."
url="https://bitbucket.org/nxg/ttl-mode"
arch=('any')
license=('unknown')
depends=('emacs')
install=emacs-ttl-mode.install
source=('https://bitbucket.org/nxg/ttl-mode/raw/ea00a82e4a17/ttl-mode.el')
md5sums=('3bafd0912a03a3e1e8fc5a78215bbfbe')
build() {
  install -D -m644 "${srcdir}"/ttl-mode.el "${pkgdir}/usr/share/emacs/site-lisp/ttl-mode.el" || return 1
}