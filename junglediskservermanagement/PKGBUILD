# Maintainer: Ernie Brodeur <ebrodeur@ujami.net>
# Originally this was the junglediskdesktop PKG.  I have modified it to download and install the server management software.

pkgname=junglediskservermanagement
_subver=160
pkgver=3.${_subver}
pkgrel=2
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace.  This is the server management client only."
arch=("i686" "x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=("gtk2" "libnotify" "libsm" "libxxf86vm")
optdepends=("fuse")

if [ "${CARCH}" == "i686" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}3${_subver}.tar.gz)
	sha1sums=('e209dfaaf5c7a2af886e3c1efeec141e2ffb7b19')
elif [ "${CARCH}" == "x86_64" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}64-3${_subver}.tar.gz)
	sha1sums=('5f6bc284c806440fa5db4b1dbccb347033313886')
fi

package() {
  cd "$srcdir/$pkgname"

	# Directories
	install -d "$pkgdir/usr/bin/"

	# Application
	install -D $pkgname "$pkgdir/usr/bin/"

	# Command-Line Utility
	install -D junglediskservermanagement "$pkgdir/usr/bin/junglediskservermanagement"

	# License
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Desktop
        install -D -m644 junglediskservermanagement.desktop "$pkgdir/usr/share/applications/junglediskservermanagement.desktop"

        # Icon
        install -D -m644 junglediskservermanagement.png "$pkgdir/usr/share/pixmaps/junglediskservermanagement.png"
}
