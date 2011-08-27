pkgname=mapnik2-svn
pkgver=2296
pkgrel=1
pkgdesc="Unstable SVN Trunk of Mapnik, the free toolkit for developing mapping applications."
url="http://mapnik.org/"
arch=(i686 x86_64)
license=('LGPL')
depends=('freetype2' 'libxml2' 'icu' 'boost-icu' 'gdal' 'curl' 'python2')
makedepends=('subversion' 'scons' 'pkgconfig')
provides=('mapnik')
conflicts=('mapnik')

_svntrunk=http://svn.mapnik.org/trunk
_svnmod=mapnik2

build() {
    cd ${srcdir}

    if [ -d "$_svnmod/.svn" ]; then
        ( cd "$_svnmod" && svn up -r $pkgver )
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r $_svnmod "$_svnmod-build"
    cd "$_svnmod-build"

    # Patch SConstruct so libs end up in /usr/lib and not in /usr/lib64 on x86_64
    sed -i -e "/LIBDIR_SCHEMA=/s/lib64/lib/" SConstruct

    python2 scons/scons.py configure \
        PYTHON=/usr/bin/python2 \
        BOOST_PYTHON_LIB=boost_python \
        INPUT_PLUGINS=all \
        OPTIMIZATION=3 \
        || return 1
}

package() {
    cd "$srcdir/$_svnmod-build"
    python2 scons/scons.py install DESTDIR="$pkgdir" PREFIX=/usr || return 1
}
