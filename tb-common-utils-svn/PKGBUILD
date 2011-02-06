pkgname=tb-common-utils-svn
pkgver=10
pkgrel=1
pkgdesc="taobao system library and network library"
arch=('i686' 'x86_64')
url="http://code.taobao.org/project/view/3/"
license=()
makedepends=('subversion')
source=()
md5sums=()

_svnmod='tb-common-utils'
_svntrunk="http://code.taobao.org/svn/tb-common-utils/trunk/"

build()
{
    cd "$srcdir/"
    msg "Getting source..."
    if [ -d "$_svnmod/.svn" ] ; then
        cd "$_svnmod" && svn --config-dir ../ -r $pkgver up
    else
        svn --config-dir ./ -r $pkgver co "$_svntrunk" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
    msg "Creating make environment..."
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

    msg "Starting make..."

    cd "$srcdir/$_svnmod-build"
	echo $pkgdir
    export TBLIB_ROOT=$pkgdir/usr
    chmod +x build.sh
    ./build.sh
    rm -rf "$srcdir/$_svnmod-build"
}
