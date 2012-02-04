# Contributer: Sebastian Sareyko <public@nooms.de>
# Contributer: Thomas Cyron <thomas@fooo.org>
pkgname=albumthing-hg
pkgver=97
pkgrel=1
pkgdesc="A simple Gtk+ client for xmms2"
depends=('xmms2-git' 'pygtk')
makedepends=('mercurial')
arch=('i686' 'x86_64')
license=('custom')
url="http://nooms.de/projects/albumthing"
source=()
md5sums=()

_hgroot="http://hg.nooms.de/albumthing"
_hgrepo=albumthing

build() {
    cp -R $startdir/src/$_hgrepo $startdir/src/$_hgrepo-build
    cd $startdir/src/$_hgrepo-build

    python setup.py build || return 1
    python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

    install -D -m 644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
    rm -rf $startdir/src/$_hgrepo-build
}
