# Maintainer:  Nicola Fontana <ntd@entidi.it>

pkgname=pfe-svn
pkgver=548
pkgrel=1
pkgdesc='An ANSI Forth based environment best targeted for embedded devices.'
url='http://pfe.sourceforge.net/'
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=('libtool')
conflicts=('pfe')
provides=('pfe')
source=()
md5sums=()

_svntrunk='http://pfe.svn.sourceforge.net/svnroot/pfe/trunk/pfe-34'
_svnmod='pfe-34'

build()
{
    cd $srcdir

    if [ -d $_svnmod/.svn ]; then
	cd $_svnmod
	svn up -r $pkgver
    else
	svn co $_svntrunk --config-dir $srcdir/.subversion -r $pkgver $_svnmod
	cd $_svnmod
    fi

    # patch -Np0 -i $srcdir/testmodule2-install.patch || exit 1
    # cd testmodule2
    # autoconf
    # cd ..
    # mkdir -p target/pfe_experimental/src/main/c/

    ./configure --prefix=/usr --without-testmodule || exit 1
    make all || exit 1
    make DESTDIR=$pkgdir install-strip || exit 1
}

package()
{
    cd $srcdir/$_svnmod
    make DESTDIR=$pkgdir install-strip || exit 1
}
