# Maintainer : 
# Contributor: Hendrik Sticher <hendrik_sticher@gmx.de>

pkgname=ggrab
pkgver=0.22a
pkgrel=1
pkgdesc="Records MPEG2 streams directly from your Dbox2 over Ethernet"
url="http://www.menzebach.de/ggrab/"
depends=()
makedepends=()
source=(http://www.menzebach.de/ggrab/$pkgname-$pkgver-linux.tgz patch-pesstream.h)
md5sums=('83a113d4ac007f535d895854f83ade35' 'cbefbd1b4dd70a602b5c6892389b43ee')
conflicts=()
provides=()

build()
{
    cd $startdir/src/$pkgname-$pkgver
    patch -p0 < ../patch-pesstream.h
    make || return 1
    mkdir -p $startdir/pkg/usr/bin
    make DESTDIR=$startdir/pkg/usr install
}

