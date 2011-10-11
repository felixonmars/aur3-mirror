# Maintainer: Maxime de Roucy <maxime.deroucy at gmail.com>

pkgname=mp3gain-foo
pkgver=1.5.2
pkgrel=1
pkgdesc="mp3gain modified to support id3v2 tags like Foobar2000 (replaygain_track_*)"
arch=('i686' 'x86_64')
url="http://mp3gain.sourceforge.net"
license=("GPL")
depends=('glibc' 'taglib')
source=("http://downloads.sourceforge.net/${pkgname%-foo}/${pkgname%-foo}-${pkgver//./_}_r2-src.zip"
	"$pkgname.patch")
md5sums=('b8e429f3225cc298c5d13d31afd050b6'
         'e798e1020e82ab99d01051f97573aaf0')

build() {
    cd $srcdir

    mkdir -p $pkgdir/usr/bin

    patch -p1 < $srcdir/$pkgname.patch

    make OSTYPE=linux
    make OSTYPE=linux INSTALL_PATH=$pkgdir/usr/bin install
}
