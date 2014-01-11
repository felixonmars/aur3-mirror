pkgname=exiv2-svn
pkgver=2989
pkgrel=1
pkgdesc="Exif and Iptc metadata manipulation library and tools"
arch=(i686 x86_64)
url="http://exiv2.org/"
license=('GPL')
depends=('gcc-libs' 'zlib' 'expat') 
makedepends=('python2' 'libpng' 'subversion')
provides=('exiv2')
conflicts=('exiv2')
_svntrunk="svn://dev.exiv2.org/svn/trunk"
_svnmod="exiv2"

build() {
    cd $srcdir  
    msg "Updating SVN entries for $_svnmod ..."
    if [ -d $_svnmod/.svn ]; then
	(cd $_svnmod && svn up -r $pkgver)
    else
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "Finished update, starting build ..."
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build
    make config
    ./configure --prefix=/usr  || return 1
    make all || return 1

#    rm -rf $srcdir/$_svnmod-build
}

package() {
    cd $srcdir/$_svnmod-build
    make DESTDIR=${pkgdir} install
}

