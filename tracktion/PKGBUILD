# Maintainer: wrl <wrl@illest.net>

pkgname=("tracktion")
pkgver=4.4.10
pkgrel=1
pkgdesc="Commercial digital audio production and composition environment."
arch=('x86_64')
url="http://www.tracktion.com/linux"
license=('custom')
depends=('freetype2' 'libx11' 'libxcb' 'alsa-lib' 'libgl')

source=("TracktionInstall_64bit_Linux_${pkgver//\./_}.deb::/dev/null")
md5sums=('8df827820bdb03dbf44b443e6db1f9cc')
sha1sums=('787063356cb50fae08acffa54822ffeb8be2309a')

if [ ! -f "${source[0]%%::*}" ]; then
msg "Manual download from www.tracktion.com/linux required."
msg2 "Place ${source[0]%%::*} in $(pwd)"
fi

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	# well, that was easy.
}
