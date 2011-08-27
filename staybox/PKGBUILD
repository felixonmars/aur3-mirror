
pkgname=staybox
pkgver=0.6.2
pkgrel=1
pkgdesc="Lite Openbox session manager"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
groups=()
depends=('gtk2' 'dbus' 'glibc' 'intltool')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)
#source=(${pkgname}-${pkgver}.tar.gz)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --sysconfdir=/etc --prefix=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
    chmod +x ${pkgdir}/usr/bin/staybox-session || return 1
}
md5sums=('f46b82c3fa47a97170d00d3c2f5e30a0')
