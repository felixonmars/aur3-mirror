# Contributor: shura <shura1991@gmail.com>

pkgname=falcon-curl-svn
pkgver=12
pkgrel=1
pkgdesc="The cURL lib binding for falcon programming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=(i686 x86_64)
makedepends=('cmake' 'subversion')
depends=('falconpl' 'curl')
provides=('falcon-curl')

_svntrunk=svn://falconpl.org/falcon/modules/curl/trunk/
_svnmod=curl-build

build ()
{
    cd $srcdir

    if [[ -e $_svnmod ]]; then
        sudo rm -Rf $_svnmod
    fi

    msg "getting sources"
    svn co $_svntrunk $_svnmod

    cd $_svnmod

    msg "configuring package"
    cmake . || return 1
    msg "compiling package"
    make || return 1
    msg "installing package"
    make install || return 1
    cd ..
    msg "cleaning"
    rm -Rf $_svnmod
}
