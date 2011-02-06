# Maintainer: Roberto Alsina <ralsina@kde.org>

pkgname=python-wordaxe-svn
pkgver=79
pkgrel=1
pkgdesc="Hyphenation support for reportlab"
arch=('i686' 'x86_64')
depends=('python' 'freetype2')
makedepends=('svn')
license=('Apache')
conflicts=('python-wordaxe')
provides=('python-wordaxe')
url="http://deco-cow.sf.net"
_svntrunk=https://deco-cow.svn.sourceforge.net/svnroot/deco-cow/trunk
_svnmod=wordaxe

build() {
    cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"
    cd $_svnmod
    python setup.py install --root=$startdir/pkg
}

md5sums=()
