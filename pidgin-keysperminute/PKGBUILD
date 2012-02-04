# Maintainer: Pavel <otchertsov@gmail.com>

_pkgname=keysperminute
pkgname=pidgin-keysperminute
pkgver=0.2
pkgrel=1
pkgdesc="Counts the keys per minute while you are typing a message and displays it"
arch=('i686 x86_64')
url="http://3d.benjamin-thaut.de/?p=12"
license=('GPL2')
depends=('pidgin')
source=(${_pkgname}_${pkgver}-${pkgrel}.tar.gz)
md5sums=('9f32c6d2a9a03904d6ed51b1467037c7')

case "$CARCH" in
    i686|i[3-5]86)
		_bldarch=('i686')
	;;
    x86_64|amd64)
		_bldarch=('x86_64')
	;;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/lib/pidgin
  cp ${_pkgname}.${_bldarch}.so ${pkgdir}/usr/lib/pidgin/${_pkgname}.so
}
