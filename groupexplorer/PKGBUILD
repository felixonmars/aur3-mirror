# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
pkgname=groupexplorer
pkgver=2.2.0
_pkgver=2.2.0.0
pkgrel=2
pkgdesc="Group Explorer is mathematical visualization software for the abstract algebra classroom"
arch=('i686' 'x86_64')
url="http://groupexplorer.sourceforge.net/"
license=('GPL2')
depends=('qt' 'mesa')
makedepends=('subversion')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/GroupExplorer${_pkgver}.res.tgz \
        GroupExplorer.desktop)
md5sums=('40b04caa5b68a7a15e1f5467ff2e9d8c'
         '62af768449029ba072e40bfc21ac9f9b')

_svnrepository=http://groupexplorer.svn.sourceforge.net/svnroot/groupexplorer/
_svnmod=groupexplorer

build() {
    cd $srcdir
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up)
    else
        svn checkout $_svnrepository $_svnmod
    fi
    msg "SVN checkout done or server timeout"

    msg "Starting make..."
    cd $_svnmod/trunk
    cp -R $srcdir/Resources . || return 1
    qmake -o Makefile GroupExplorer.pro PREFIX=/usr || return 1
    make || return 1
}

package() {
    install -d $pkgdir/usr/share/{applications,pixmaps,$pkgname,$pkgname/Resources} \
        $pkgdir/usr/bin || return 1

    cd $srcdir/$_svnmod/trunk

    install -m755 GroupExplorer $pkgdir/usr/share/$pkgname/ || return 1
    install -m644 Resources/GroupExplorer.ico $pkgdir/usr/share/pixmaps/ || return 1
    install -m644 $startdir/GroupExplorer.desktop $pkgdir/usr/share/applications/ || return 1
    cp -R Resources/* $pkgdir/usr/share/$pkgname/Resources/ || return 1
    chmod 644 -R $pkgdir/usr/share/$pkgname/Resources/* || return 1

    ln -s $pkgdir/usr/share/$pkgname/GroupExplorer $pkgdir/usr/bin/GroupExplorer || return 1
}
