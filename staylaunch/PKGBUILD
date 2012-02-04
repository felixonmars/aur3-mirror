pkgname=staylaunch
pkgver=0.6.1
pkgrel=1
pkgdesc="*box auto launcher & configurator"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
groups=()
depends=('gtk2' 'dbus' 'glibc' 'intltool')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/staybox/apps/staylaunch-0.6.1.tar.bz2)
#http://downloads.sourceforge.net/project/staybox/apps/
build() {
    cd ${srcdir}/staylaunch-${pkgver}
    ./configure --sysconfdir=/etc --prefix=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
}
md5sums=('835b13cad76f1b269be057a6fc11e059')
