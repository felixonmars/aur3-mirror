# $Id:$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)
# Maintainer: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=ta-lib-svn
pkgver=1542
pkgrel=2
pkgdesc="Technical Analysis Library for C/C++"
arch=('i686' 'x86_64')
url=http://ta-lib.org/
license=('custom:BSD')
makedepends=('rsync' 'subversion')
provides=('ta-lib')
conflicts=('ta-lib')
options=('!libtool')

_svntrunk=https://ta-lib.svn.sourceforge.net/svnroot/ta-lib/trunk/ta-lib/c
_svnmod=ta-lib-svn

source=('LICENSE.txt' 'PKGBUILD.local' 'Makefile.am.patch' 'configure.in.patch')

if [ -x PKGBUILD.local ]; then
    . ./PKGBUILD.local
fi

build() {
    msg "Connecting to SVN server..."
    cd $srcdir
    if [ -d "${_svnmod}/.svn" ]; then
	cd ${_svnmod} && svn up
    else
	svn co ${_svntrunk} ${_svnmod}
    fi
    msg "SVN checkout done or server timeout"

    msg "Preparing builddir..."
    rsync -av --delete --exclude '.svn*' $srcdir/${_svnmod}/ $srcdir/${_svnmod}-build
    cd $srcdir/${_svnmod}-build || return $?
    for p in $srcdir/*.patch; do
	msg2 "Applying patch ${p##*/}"
	patch -sp0 < ${p} || return $?
    done
    mkdir -pv m4 || return $?
    autoreconf -iv || return $?

    msg "Starting ./configure..."
    ./configure --prefix=/usr || return $?

    msg "Starting make all install..."
    make || return $?
    make DESTDIR=$pkgdir install || return $?

    msg "Making it nice..."
    install -Dm664 $srcdir/LICENSE.txt \
	$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=4 sw=4 et:
md5sums=('825f12513131aed4b23b5099a91ab8ce'
         'e26ad5fa0b9dd7835728038759649b9c'
         '8228fa4f7be9da6c431f6670a873a9c6'
         'd08d5d27ecd7c30af6f94883616e5ead')
