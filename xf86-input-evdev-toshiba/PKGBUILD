# Maintainer: Erik Xian <erikxian@gmail.com>

pkgname=xf86-input-evdev-toshiba
_pkgname=xf86-input-evdev
pkgver=2.3.2
pkgrel=1
pkgdesc="X.org evdev input driver with patch for Toshiba laptop volume wheels"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.7.0' 'inputproto>=2.0' 'randrproto>=1.3.1')
conflicts=('xorg-server<1.7.0' "$_pkgname")
provides=("$_pkgname=$pkgver")
options=('!libtool')
groups=('xorg-input-drivers')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2 volwheelfix.patch)
sha1sums=('b3512cd2747727ec06733997067c7ff15f602115'
          '1330850c61685830e5133208a286beb956bc928c')

build() {
  patch -p0 <volwheelfix.patch
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/" || return 1
}
