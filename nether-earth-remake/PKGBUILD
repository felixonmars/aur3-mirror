# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=nether-earth-remake
pkgver=0.53_1292
_realver=0.53-1292
pkgrel=2
pkgdesc="Remake of Nether Earth the very first real time strategy game"
arch=('i686' 'x86_64')
url="http://www.braingames.getput.com/nether/default.asp"
license=('custom')
depends=('bash' 'sdl_mixer' 'freeglut')
source=(http://braingames.afraid.org/nether/downloads/nether.src_$_realver.tgz)
md5sums=('4473cc304b39b083d4c7d679fb88582d')

build() {
    cd "$srcdir/nether_$_realver"

    make || return 1
    make PREFIX="$pkgdir/usr" GAMEDIR="$pkgdir/usr/bin" BINDIR="$pkgdir/usr/share/$pkgname" install || return 1
    sed -e '/nether/d;a\cd "/usr/share/nether-earth-remake"; ./nether; cd -' -i $pkgdir/usr/bin/nether || return 1
}

