# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brock.Zheng <goodmenzy@gmail.com>
pkgname=emacs-goodies-el
pkgver=35.12
pkgrel=1
pkgdesc="Debian maintained Miscellaneous add-ons for Emacs"
arch=('any')
url="http://ftp.de.debian.org/debian/pool/main/e/emacs-goodies-el/"
license=('GPL2 GPL3')
groups=()
depends=(emacs)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ftp.de.debian.org/debian/pool/main/e/emacs-goodies-el/${pkgname}_${pkgver}.tar.xz"
        "http://ftp.de.debian.org/debian/pool/main/e/emacs-goodies-el/${pkgname}_${pkgver}.dsc")
sha256sums=('8b626f6211492aea2b607facfcce0622dcc310ce4108b3a33f8020227873388f'
            'ce794ccd8f9ace8a656fe08181a0b7915a3070b7e4a86c8b27540ef70c68ed6f')
noextract=()

build() {
  cd $startdir/src/$pkgname-$pkgver
}

package() {

  cd $startdir/src/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/
  cp -r elisp/emacs-goodies-el $pkgdir/usr/share/emacs/site-lisp/
}

# vim:set ts=2 sw=2 et:
