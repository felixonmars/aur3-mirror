pkgname=raster3d
pkgver=2.7d
pkgrel=1
pkgdesc="Raster3D is a set of tools for generating high quality raster images of proteins or other molecules."
url="http://skuld.bmsc.washington.edu"
license=""
depends=()
makedepends=(rpmextract)
conflicts=()
replaces=()
backup=()
install=
source=(http://skuld.bmsc.washington.edu/raster3d/Raster3D-2.7d-2.i586.rpm)
md5sums=(051f14ae0a20e75cfa17baedbad84c98)

build() {
    cd $startdir/src
    rpmextract.sh Raster3D-2.7d-2.i586.rpm
    chmod 755 usr
    chmod 755 usr/local
    chmod 755 usr/local/bin
    chmod 755 usr/local/share
    chmod 755 usr/local/man
    mv usr ../pkg
}
