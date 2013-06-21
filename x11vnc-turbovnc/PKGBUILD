# $Id: PKGBUILD 168731 2012-10-15 02:00:18Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)

pkgname=x11vnc-turbovnc
pkgver=0.9.13
pkgrel=1
pkgdesc='VNC server for real X displays with TurboVNC support'
url='http://www.karlrunge.com/x11vnc/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('openssl' 'libjpeg-turbo' 'libxtst' 'libxinerama' 'libxdamage' 'libxrandr' 'avahi')
optdepends=('tk: for GUI support')
provides=("x11vnc=$pkgver")
conflicts=('x11vnc')
backup=('etc/conf.d/x11vnc')
source=("http://downloads.sourceforge.net/project/libvncserver/x11vnc/${pkgver}/x11vnc-${pkgver}.tar.gz"
        'service'
        'conf.d'
        'rc.d')
sha1sums=('f011d81488ac94dc8dce2d88739c23bd85a976fa'
          '53e1ed7f84518a699a29607a03bee2321f9f9624'
          '11011cce06511e9ba61672a1c80bb63a3a187539'
          '477892cf0f0020043444b7493c80684762ded506')

build() {
    cd "${srcdir}/x11vnc-${pkgver}"
    cd x11vnc/misc/turbovnc
    ./apply_turbovnc
    cd ../../..
    ./configure --prefix=/usr --mandir=/usr/share/man
    make AM_LDFLAGS='-lturbojpeg'
}

package() {
    cd "${srcdir}/x11vnc-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm755 ../rc.d "${pkgdir}/etc/rc.d/x11vnc"
    install -Dm644 ../conf.d "${pkgdir}/etc/conf.d/x11vnc"
    install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/x11vnc.service"
    rm -fr "${pkgdir}"/usr/include/rfb # provided by libvncserver
}
