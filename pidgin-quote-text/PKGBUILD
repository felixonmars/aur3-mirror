# Maintainer: Pavel <otchertsov@gmail.com>

pkgname=pidgin-quote-text
pkgver=0.9.3
pkgrel=1
pkgdesc="Quote selected message into the entry area"
arch=('i686' 'x86_64')
url="https://launchpad.net/quote/"
license=('GPL2')
depends=('pidgin')

case "$CARCH" in
    i686|i[3-5]86)
		source=(http://launchpad.net/quote/trunk/0.9.3/+download/quote_text.so.i386.zip)
		md5sums=('fa1324aed3e5fa20dc7dc270a02715bd')
	;;
    x86_64|amd64)
		source=(http://launchpad.net/quote/trunk/0.9.3/+download/quote_text.so.x64.zip)
		md5sums=('1d97b107a93424f1707218d335ecdb88')
	;;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/lib/pidgin
  cp *.so ${pkgdir}/usr/lib/pidgin
}
