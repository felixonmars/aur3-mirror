# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-input-tslib
pkgver=0.0.6
pkgrel=1
pkgdesc="X.org tslib input driver"
arch=(arm i686 x86_64)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('xorg-server')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
backup=("etc/ts.conf")
source=("http://pengutronix.de/software/${pkgname}/download/${pkgname}-${pkgver}.tar.bz2"
	"20-tslib.conf")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m644 "${srcdir}/20-tslib.conf" "${pkgdir}/etc/X11/xorg.conf.d/20-tslib.conf"
}
md5sums=('b7a4d2f11637ee3fcf432e044b1d017f'
         '2c49ec053e67a17fb71ce6dc2b12b6f6')
