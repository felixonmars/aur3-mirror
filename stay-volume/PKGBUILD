pkgname=stay-volume
pkgver=0.6.5
pkgrel=1
pkgdesc="Simple tray volume indicator"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
groups=()
depends=('gtk2' 'glibc' 'alsa-utils')
makedepends=('pkgconfig')

source=(http://downloads.sourceforge.net/project/staybox/apps/${pkgname}-${pkgver}.tar.bz2)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --sysconfdir=/etc --prefix=/usr || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
md5sums=('b2748a4c44afe153ae46c76de3e0eecc')
