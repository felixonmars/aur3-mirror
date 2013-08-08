# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt do de>

pkgname=exactimage-svn
pkgver=1859
pkgrel=1
pkgdesc="A fast, modern and generic image processing library, \
        including hocr2pdf and other utilities"
provides=('exactimage')
conflicts=('exactimage')
makedepends=('subversion')
depends=('openexr' 'agg' 'giflib' 'jasper' 'lcms' 'libpng')
optdepends=('python2' 'lua' 'ruby')
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.exactcode.de/site/open_source/exactimage/"
source=("svn+https://svn.exactcode.de/exact-image/trunk"
        "https://gist.github.com/balr0g/3004353/raw/0d13d46b693987faa769120d77c416518b85efb7/exactimage-libpng15.patch")
md5sums=('SKIP'
         '2473296cd649e88f4a40db2126254214')

pkgver() {
  cd $srcdir/trunk
  svnversion | tr -d [A-z]
}

build() {
    cd $srcdir/trunk

    msg "Patching for libpng 1.5..."
    patch -p1 < $srcdir/exactimage-libpng15.patch

    msg "Patching for python2..."
    sed -i "s/python -V/python2 -V/" configure
    sed -i "s/python-config --includes/python2-config --includes/" configure
    sed -i "s/shell python -c/shell python2 -c/" api/python/Makefile

    msg "Starting make..."
#    ./configure --prefix=/usr --with-libungif=-lgif --without-libpng
    ./configure --prefix=/usr --with-libungif=-lgif
    make
}

package() {
    cd $srcdir/trunk
    make DESTDIR=$pkgdir install
}
