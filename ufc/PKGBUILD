# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufc
pkgver=2.0.5
pkgrel=1
pkgdesc="A unified framework for finite element assembly."
arch=('i686' 'x86_64')
url="http://launchpad.net/ufc"
license=('?')
groups=('fenics')
depends=('python2') # 'boost' 'swig')
options=(!emptydirs)
source=($url/2.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('7edcdd12cbd2d4a0525aa017281771c4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    [[ -e build ]] || mkdir build 
    cd "$srcdir/$pkgname-$pkgver/build"

    # replace python with python2 everywhere
    find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	     -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
	     -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
             -DPYTHON_LIBRARY:FILEPATH=/usr/lib/libpython2.7.so
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
