# Contributors: Mladen Pejaković <pejakm@gmail.com>

pkgname=amora-server
pkgver=1.1
pkgrel=1
pkgdesc="Amora: A mobile remote assistant - server"
url="http://code.google.com/p/amora/"
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('gcc' 'bluez-libs')
conflicts=()
provides=('amora-server')
source=(http://amora.googlecode.com/files/${pkgname}-${pkgver}.tar.gz \
        amora.svg \
        amora.desktop \
        amorad \
        amora)
md5sums=('274d53f40feabb09563eb90ae1c1b38f'
         '0f1bcb216bc2ff1150be01adc1dbbff9'
         '1ccda30d2c6fe58a214e00da8d33a9b2'
         '6d970dd2680bcd90e781f3d76e6df0a0'
         '1ee02f7d62cd2915bfe21b1c77a6f428')
build() {
 cd ${startdir}/src/${pkgname}-${pkgver}
 ./configure --prefix=/usr
 make || 1
 make DESTDIR=${pkgdir} install || 1
 install -D ../amora.svg /${pkgdir}/usr/share/icons/hicolor/scalable/apps/amora.svg || 1
 install -D ../amora.desktop /${pkgdir}/usr/share/applications/amora.desktop || 1
 install -D ../amorad /${pkgdir}/etc/rc.d/amorad || 1
 install -D ../amora /${pkgdir}/etc/conf.d/amora || 1
}
