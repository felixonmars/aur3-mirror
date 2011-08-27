# Contributor: shura <shura1991@gmail.com>

pkgname=falconpl-svn
pkgver=9999
pkgrel=1
pkgdesc="Falcon Programming Language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=('i686' 'x86_64')
makedepends=('cmake' 'subversion')
provides=('falconpl')
replace=('falcon' 'falconpl')

_core_svntrunk=svn://falconpl.org/falcon/core/trunk
_core_svnmod=falcon-core
_feathers_svntrunk=svn://falconpl.org/falcon/modules/feathers/trunk
_feathers_svnmod=falcon-feathers

build ()
{
    cd $srcdir

    msg "Getting sources"

    if [[ -e $_core_svnmod/.svn ]]; then
        cd $_core_svnmod && svn up
    else
        svn co $_core_svntrunk --config-dir ./ $_core_svnmod
    fi

    if [[ -e $_feathers_svnmod/.svn ]]; then
        cd $_feathers_svnmod && svn up
    else
        svn co $_feathers_svntrunk --config-dir ./ $_core_svnmod
    fi
    
    rm -Rf $srcdir/$_core_svnmod-build
    cp -R $srcdir/$_core_svnmod $srcdir/$_core_svnmod-build
    cd $srcdir/$_core_svnmod-build

    msg "Configuring core package"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
    msg "Compiling core package"
    make || return 1
    msg "Installing core package"
    make DESTDIR=$pkgdir install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    install -Dm664 LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon/LICENSE || return 1

    rm -Rf $srcdir/$_feathers_svnmod-build
    cp -R $srcdir/$_feathers_svnmod $srcdir/$_feathers_svnmod-build
    cd $srcdir/$_feathers_svnmod-build

    msg "Configuring feathers package"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
    msg "Compiling feathers package"
    make || return 1
    msg "Installing feathers package"
    make DESTDIR=$pkgdir install || return 1

    msg "Cleaning-up"
    rm -Rf $startdir/$_core_svnmod-build $startdir/$_feathers_svnmod-build
}
