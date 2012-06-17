# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=python-luban-doc-bzr
_pkgname=python-luban-doc
pkgver=704
pkgrel=1
pkgdesc="a generic (web) user interface language documentation"
arch=("any")
url="http://lubanui.org"
license=('custom')
makedepends=('python-sphinx')
provides=($_pkgname)
conflicts=($_pkgname)

_bzrtrunk="https://code.launchpad.net/~jiao-lin/luban/trunk"
_bzrmod="luban"

build() {
    cd $srcdir

    msg "Connecting to Bazaar server...."
    rm -rf doc
    bzr export --format=dir doc lp:luban/trunk/docs -r "$pkgver"
    msg "Bazaar checkout done or server timeout"
    msg "Starting build..."

    cd doc
    sed -i "s/from release import version as release/release=\"$pkgver\"/"  conf.py
    make html
}

package() {
    mkdir -p $pkgdir/usr/share/doc
    mv $srcdir/doc/_build/html $pkgdir/usr/share/doc/python-luban/
}

# vim:set ts=2 sw=2 et:
