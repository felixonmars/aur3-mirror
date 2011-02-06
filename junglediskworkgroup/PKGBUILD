# Jungle Disk Workgroup
# Contributor: Andrew Stromme <astromme at chatonka.com>
# Based off of the Jungle Disk Desktop package of:
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=junglediskworkgroup
subver=04
pkgver=3.${subver}
pkgrel=2
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace"
arch=("i686" "x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=("gtk2" "libsm" "libxxf86vm")
optdepends=("fuse")
replaces=('jungledisk')
conflicts=('jungledisk')

if [ "${CARCH}" == "i686" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}3${subver}.tar.gz)
	sha1sums=('c26e2803fb37629a06570155381d4cef80d5807b')
elif [ "${CARCH}" == "x86_64" ]; then
	source=(http://downloads.jungledisk.com/jungledisk/${pkgname}64-3${subver}.tar.gz)
	sha1sums=('547df34084d1614ff6b44cd3b4f480279e753894')
fi

build() {
	cd ${srcdir}/${pkgname}/

	# Directories
	install -d ${pkgdir}/usr/bin/

	# Application
	install -D ${pkgname} ${pkgdir}/usr/bin/

	# License
	install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	# Desktop
        install -D junglediskworkgroup.desktop ${pkgdir}/usr/share/applications/junglediskworkgroup.desktop

        # Icon
        install -D junglediskworkgroup.png ${pkgdir}/usr/share/pixmaps/junglediskworkgroup.png
}
