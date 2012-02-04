# Maintainer: Ernie Brodeur <ebrodeur@ujami.net>
# Originally this was the junglediskdesktop PKG.  I have modified it to download and install the server management software.

pkgname=junglediskserver
_subver=160
pkgver=3.${_subver}
pkgrel=1
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace.  This is the server daemon only."
arch=("i686" "x86_64")
url="http://www.jungledisk.com/"
license=("custom")

if [ "${CARCH}" == "i686" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}3${_subver}.tar.gz)
	md5sums=('de255303aed2bbfb73650de84a9ec443')
elif [ "${CARCH}" == "x86_64" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}64-3${_subver}.tar.gz)
	md5sums=('48aec9d805e489e8511c2dfccfe96a96')
fi

package() {
  cd "$srcdir/$pkgname"

	# Directories
	install -d "$pkgdir/usr/bin/"

	# Application
	install -D $pkgname "$pkgdir/usr/bin/"

	# Documentation
	install -D INSTALL "$pkgdir/usr/share/doc/${pkgname}/INSTALL"

	# init.d (Probably shouldn't make this relative like this, just trying to get it working.)
	install -D -m755 ../../junglediskserver.rc "$pkgdir/etc/rc.d/${pkgname}"
	
	# license-example.xml
	install -D -m600 junglediskserver-license-EXAMPLE.xml "$pkgdir/etc/jungledisk/junglediskserver-license-EXAMPLE.xml"
}
