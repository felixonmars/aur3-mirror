# ELIM, an Emacs client to libpurple
# Contributor: Andre Ramaciotti da Silva 
#              andre.ramaciotti <at> gmail.com

pkgname=emacs-elim-git
pkgver=20100909
pkgrel=1
pkgdesc="ELIM is an IM client for Emacs."
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/elim"
license=('GPL')
depends=('emacs' 'libpurple' 'libxml2' 'glib2')
makedepends=('git')
conflicts=('emacs-elim')
source=()
install=emacs-elim.install
md5sums=()
_gitroot=git://git.savannah.nongnu.org/elim.git
_gitname=elim

build() {
    cd ${srcdir}
    msg "Connecting to the GIT server...."
    if [ -d $_gitname ]; then
      (cd $_gitname; git pull origin)
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname
    fi  

    rm -rf elim-build
    cp -r elim elim-build
    cd elim-build
    LDFLAGS= make || return 1

    install -d ${pkgdir}/usr/{bin,share/{emacs/site-lisp,doc/emacs-elim}}
    install -m755 ${srcdir}/elim-build/elim-client ${pkgdir}/usr/bin
    install -m644 ${srcdir}/elim-build/elisp/* ${pkgdir}/usr/share/emacs/site-lisp
    install -m644 ${srcdir}/elim-build/README ${pkgdir}/usr/share/doc/emacs-elim

    cd ${pkgdir}/usr/share/emacs/site-lisp 
    for _i in *; do
      emacs -batch -q -f batch-byte-compile ${_i}
    done || return 1
}
