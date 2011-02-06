# Contributor: Tony Lainson <tony@sdr.com.au>

pkgname=primateplunge
pkgver=1.1
pkgrel=1
pkgdesc="An addictive platform game starring a monkey"
arch=(i686 x86_64)
url="http://www.aelius.com/primateplunge/"
license=""
depends=('sdl_mixer')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.aelius.com/primateplunge/$pkgname-$pkgver.tar.gz)
md5sums=('dd89b75d3af7dbbc3af3e9b2d8909c50')

build() {
        cd $startdir/src/$pkgname-$pkgver || return 1
        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR=$startdir/pkg install || return 1
}
