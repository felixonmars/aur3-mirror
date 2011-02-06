# Maintainer: Roberto Alsina <ralsina@kde.org>

pkgname=python-reportlab-svn
pkgver=3464
pkgrel=1
pkgdesc="A proven industry-strength PDF generating solution"
arch=('i686' 'x86_64')
depends=('python' 'freetype2')
makedepends=('svn')
license=('CUSTOM')
conflicts=('python-reportlab')
provides=('python-reportlab')
source=()
url="http://www.reportlab.org/rl_toolkit.html"
_svntrunk=https://svn.reportlab.com/svn/public/reportlab/trunk
_svnmod=reportlab

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
    install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}

md5sums=()
