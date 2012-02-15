# Contributor: Juanma Hernandez <juanmah@gmail.com>

pkgname=rsw
pkgver=0.4.2
pkgrel=1
_trunk=0.4
pkgdesc="Real-time Sunlight Wallpaper"
arch=('i686' 'x86_64')
url="http://realtimesunlightwallpaper.weebly.com/"
license=('GPL2' 'LGPL2.1')
depends=('gtk3' 'hicolor-icon-theme' 'curl')
makedepends=('')
provides=('rsw')
install=rsw.install
source=(http://launchpad.net/realtimesunlightwallpaper/trunk/$pkgver/+download/gtk-sunlight-$pkgver.tar.gz)
md5sums=('03e871ff8aefb3ba70a707ef80a82159')

build() {

        cd $startdir/src/gtk-sunlight-$pkgver
	make clean || return 1
        make || return 1
        make DESTDIR=${startdir}/pkg install || return 1

}
