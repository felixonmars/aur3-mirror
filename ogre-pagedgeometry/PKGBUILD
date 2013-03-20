# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=ogre-pagedgeometry
pkgver=1.1.3
pkgrel=2
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogre-paged"
license=('MIT')
makedepends=('ogre' 'boost')
source=(http://ogre-paged.googlecode.com/files/ogre-paged-1.1.3.tar.gz)
md5sums=('14dde42c0d1d2f52e225ccbc1c23c82f')

build() {
    cd $srcdir/ogre-paged-$pkgver

    cmake . -DPAGEDGEOMETRY_BUILD_SAMPLES=0 \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd $srcdir/ogre-paged-$pkgver

    make DESTDIR=$pkgdir install

    # Put the docs into the proper place with their own directory
    docdir=$pkgdir/usr/share/doc
    mkdir -p $docdir
    mv $pkgdir/usr/doc $docdir/ogre-pagedgeometry
}
