# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=a7xpg
pkgver=0.11
pkgrel=3
pkgdesc="An addictive game by Kenta Cho.  Collect gold with your ship and avoid the enemies!"
arch=('i686' 'x86_64')
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/a7xpg_e.html"
license=('custom')
depends=('libgl' 'sdl_mixer')
makedepends=('gdc-bin')
source=(http://www.asahi-net.or.jp/~cs8k-cyu/windows/${pkgname}0_11.zip
        http://ftp.de.debian.org/debian/pool/main/a/$pkgname/${pkgname}_$pkgver.dfsg1-5.diff.gz)

build() {
    cd $srcdir/$pkgname
    patch -p1 <../${pkgname}_0.11.dfsg1-5.diff || return 1
    while read x; do
        patch -p1 <debian/patches/"$x" || return 1
    done <debian/patches/series

    sed -i 's,/games,,g' ./src/abagames/util/sdl/Sound.d ./src/abagames/util/sdl/Texture.d \
        ./debian/$pkgname-data.install
    sed -i 's,/games,/usr,g' ./debian/menu ./debian/$pkgname.desktop ./debian/$pkgname.install

    make || return 1
    mkdir -p $pkgdir/usr/share
    install -D -m755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname

    cp -r $srcdir/$pkgname $pkgdir/usr/share/$pkgname
    install -D -m644 $srcdir/$pkgname/debian/copyright        $pkgdir/usr/share/licenses/$pkgname/copyright
    install -D -m644 $srcdir/$pkgname/debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m644 $srcdir/$pkgname/debian/$pkgname.xpm     $pkgdir/usr/share/pixmaps/$pkgname.xpm
}

md5sums=('3280918840913d629b13dc02bcbbfa7d'
         '1c7df16996ac290e9a3658a9c54411a6')
