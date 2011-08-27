# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=museekbindings-svn
pkgver=925
pkgrel=1
pkgdesc="Python bindings for Museek clients."
url="http://www.museek-plus.org/"
depends=('python')
makedepends=('subversion' 'cmake' 'swig')
license='GPL'
arch=('i686' 'x86_64')
source=()
md5sums=()
conflicts=('museekbindings' 'museekplus-svn' 'museek-plus')
provides=('museekbindings')

_svntrunk=http://www.museek-plus.org/svn/museek+/trunk/sources
_svnmod=museek+

build() {
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    cmake -DNO_MUSEEKD=1 -DNO_MUSCAN=1 -DNO_SETUP=1 -DNO_PYMUCIPHER=0 \
          -DNO_MUSEEQ=1 -DBINDINGS=1 -DMURMUR=0 -DMUCOUS=0 -DCLIENTS=0 \
          -DPREFIX=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir" install

    rm -rf ${srcdir}/$_svnmod-build
}
# vim:et syntax=sh ts=4
