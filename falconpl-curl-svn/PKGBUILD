# Contributor: shura <shura1991@gmail.com>

pkgname=falconpl-curl-svn
pkgver=9999
pkgrel=1
pkgdesc="The cURL lib binding for falcon programming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=('i686' 'x86_64')
makedepends=('cmake' 'subversion' 'falconpl')
provides=('falconpl-curl')
replace=('falcon-curl' 'falconpl-curl')

_svntrunk=svn://falconpl.org/falcon/modules/curl/trunk
_svnmod=falcon-curl

build ()
{
    cd $srcdir

    msg "Getting sources"

    if [[ -e $_svnmod/.svn ]]; then
        cd $_svnmod && svn up
    else
        svn co $_svntrunk --config-dir ./ $_svnmod
    fi

    rm -Rf $srcdir/$_svnmod-build
    cp -R $srcdir/$_svnmod $srcdir/$_svnmod-build
    cd $srcdir/$_svnmod-build

    msg "Configuring core package"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
    msg "Compiling core package"
    make || return 1
    msg "Installing core package"
    make DESTDIR=$pkgdir install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    
    msg "Cleaning up"
    rm -Rf $startdir/$_svnmod-build
}
