# Contributor: Pavel <otchertsov@gmail.com>

pkgname=pidgin-convcharcount-plugin
pkgver=2.3.1
pkgrel=1
pkgdesc="Pidgin character counting plugin"
arch=('i686 x86_64')
url="http://static.panoptic.com/pidgin/"
license=('GPL')
depends=('pidgin')

case "$CARCH" in
    i686|i[3-5]86)
		_bldarch=i386
		md5sums=('794619d854847a52e6f2209fd666b6d0')
	;;
    x86_64|amd64)
		_bldarch=amd64
		md5sums=('efd9f9ba0e658e4798e558b892ba83f9')
	;;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

source=(http://static.panoptic.com/pidgin/${pkgname}_${pkgver}-${pkgrel}_${_bldarch}.deb)

build() {
	cd $srcdir
	ar -x ${pkgname}_${pkgver}-${pkgrel}_${_bldarch}.deb
	tar -xf data.tar.gz -C ${pkgdir}
}
