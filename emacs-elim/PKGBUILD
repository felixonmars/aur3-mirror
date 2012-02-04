# ELIM, an Emacs client to libpurple
# Contributor: Andre Ramaciotti da Silva
#              andre.ramaciotti <at> gmail.com

pkgname=emacs-elim
pkgver=20100326
pkgrel=031855
pkgdesc="ELIM is an IM client for Emacs."
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/elim"
license=('GPL')
depends=('emacs' 'libpurple' 'libxml2' 'glib2')
source=("http://download.savannah.gnu.org/releases/elim/elim.${pkgver}-${pkgrel}.tar.gz")
install=emacs-elim.install
md5sums=('6ecd67236cec5bf57028ba2c5fbe85d7')

build() {
    cd ${srcdir}/elim
    LDFLAGS= make || return 1

    mkdir -p ${pkgdir}/usr/{bin,share/{emacs/site-lisp,emacs-elim}}
    install -m755 ${srcdir}/elim/elim-client ${pkgdir}/usr/bin
    install -m644 ${srcdir}/elim/elisp/* ${pkgdir}/usr/share/emacs/site-lisp
    install -m644 ${srcdir}/elim/README ${pkgdir}/usr/share/emacs-elim
}
