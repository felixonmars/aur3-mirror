# Contributor: dhamp <dhamp@ya.ru>
_name=eiskaltdc
pkgname=$_name-svn
pkgver=784
pkgrel=1
pkgdesc="Qt4-based GUI-frontend for dclib(like Valknut) with segmented downloading"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eiskaltdc/"
depends=('qt>=4.5' 'openssl' 'bzip2' 'libxml2' 'zlib')
makedepends=('subversion' 'gcc' 'pkgconfig' 'cmake')
conflicts=('eiskaltdc' 'eiskaltdc-svn' 'dclib' 'dclib-svn')
provides=('eiskaltdc')
options=(!emptydirs)
_svntrunk="https://eiskaltdc.svn.sourceforge.net/svnroot/eiskaltdc/trunk"
_svnmod=trunk
build() {
        cd "${srcdir}"
        if [ -d $svnmod/.svn ]; then
               (cd $svnmod && svn up -r $pkgver)
        else
        svn co $_svntrunk $_svnmod
        fi
        msg "SVN checkout done or server timeout"
        msg "Starting make..."
        rm -rf $srcdir/$_name-build
        cp -r $srcdir/$_svnmod $srcdir/$_name-build
        cd $_name-build
        cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
        make DESTDIR=$pkgdir install || return 1
        rm -rf $srcdir/$_name-build
}
