# Maintainer: mw4rf <mw4rf@sent.at>

pkgname=flattr-icons
pkgver=0.1
pkgrel=1
pkgdesc="flat and colored icon theme"
url="http://nitrux.weebly.com/"
license=('CC A-NC-ND 3.0')
arch=('any')
depends=('')
makedepends=()
source=("http://nitrux.weebly.com/uploads/1/9/8/8/19881405/flattr.tar.gz")

package() {
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/share/icons
	msg2 "Copying files..."
	cp -rf ${srcdir}/Flattr ${pkgdir}/usr/share/icons
}


md5sums=('4462ab83b93cede6f847a04de3c12640')

# NOTE : update md5sum with 'updpkgsums' command
