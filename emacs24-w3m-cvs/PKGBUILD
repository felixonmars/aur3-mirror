# Maintainer: Auston Jary <anyeccc@gmail.com>

pkgname=emacs24-w3m-cvs
pkgver=20120415
pkgrel=1
pkgdesc="w3m browser for emacs24 (cvs)"
arch=(i686 x86_64)
url="http://emacs-w3m.namazu.org/"
license=('GPL')
options=(docs)
depends=('emacs' 'w3m')
makedepends=('cvs' 'autoconf')
install=

package() {
    cd $srcdir
    msg "Connecting to cvs server for emacs-w3m development version..."
    if [[ -d emacs-w3m ]]; then
        cd emacs-w3m
        cvs update -d
    else
        cvs -d :pserver:anonymous:@cvs.namazu.org:/storage/cvsroot co emacs-w3m
    fi

    msg "Done checking out..."
    msg "Starting builds..."

    cd emacs-w3m
    if [[ -f configure ]]; then
        ./configure
    else
        autoconf
        ./configure
        make
    fi

    msg "Done builds..."
    msg "Starting install..."

    sudo make install
}
