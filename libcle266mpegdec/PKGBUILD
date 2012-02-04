# Contributor: Maik Opitz <maik@fjordblau.de>

pkgname=libcle266mpegdec
pkgver=0.5
pkgrel=1
arch=(i686)
pkgdesc="VIA CLE266 MPEG-2 hardware decoding library"
url="http://cle266mpegdec.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/cle266mpegdec/$pkgname-$pkgver.tar.gz)
md5sums=('875faf1f5793e81590376b5bdf1e3cc0')

build() {

    cd $startdir/src/$pkgname-$pkgver

    ./configure --prefix=/usr

    make || return 1

    make DESTDIR=$startdir/pkg install || return 1
}
