# Maintainer: Jörg Hansen (joerg dot hansen at ymail dot com)

pkgname=mapnik-svn
pkgver=3362
pkgrel=1
pkgdesc="Free toolkit for developing mapping applications."
url="http://mapnik.org/"
arch=(i686 x86_64)
license=('LGPL')
depends=('freetype2' 'libxml2' 'icu' 'boost' 'pycairo' 'cairomm' 'gdal' 'curl' )
makedepends=('subversion' 'scons' 'pkgconfig' 'python2')
conflicts=('mapnik')
provides=('mapnik')

_svntrunk=http://svn.mapnik.org/trunk
_svnname=mapnik

build() {

    cd $srcdir

    msg "SVN checking out..."

    if [ -d $_svnname/.svn ]; then
        (cd $_svnname && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnname
    fi

    msg "SVN checkout done"

    if [[ -d $srcdir/$_svnname-build ]]; then
        msg "Removing previous build directory..."
        rm -rf $srcdir/$_svnname-build
    fi

    msg "Creating build directory..."
    cp -r $srcdir/$_svnname $srcdir/$_svnname-build

    # Patch SConstruct so libs end up in /usr/lib and not in /usr/lib64 on x86_64
    msg "Fixing LIBDIR_SCHEMA..."
    cd $srcdir/$_svnname-build
    sed -i -e "/LIBDIR_SCHEMA=/s/lib64/lib/" SConstruct

    msg "Configuring..."
    python2 scons/scons.py configure

    msg "Compiling and installing..."
    python2 scons/scons.py install DESTDIR="$pkgdir" PREFIX=/usr

}
