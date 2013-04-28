# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=('via-chrome9-dri')
[[ $CARCH == x86_64 ]] && pkgname+=('lib32-via-chrome9-dri')
pkgver=92.006.75396
pkgrel=1
pkgdesc="VIA proprietary chrome9 3D driver"
arch=('i686' 'x86_64')
url="http://linux.via.com.tw"
license=('custom')
depends=('xf86-video-via-chrome9')
makedepends=('p7zip')
source=('ubuntu-12.10-unified_gfx_driver_Linux_5-76-52-92_006-75396.7z::http://linux.via.com.tw/support/beginDownload.action?eleid=704&fid=1004')
md5sums=('eccd0b42fc2b42cf102416a725677e44')

build() {
	cd "$srcdir/ubuntu-12.10-unified_gfx_driver_Linux_5-76-52-92_006-75396"

	# extract i686 binary
	tar xzf U12.10_32bit/mesa8.1/5.76.52.92-u1210_32bit-mesa8.1-75396.tar.gz \
		--strip-components=2 \
		-C U12.10_32bit/mesa8.1 \
		5.76.52.92-u1210_32bit-75396/bin/via_chrome9_dri.so

	# extract x86_64 binary
	tar xzf U12.10_64bit/mesa8.1/5.76.52.92-u1210_64bit-mesa8.1-75396.tar.gz \
		--strip-components=2 \
		-C U12.10_64bit/mesa8.1 \
		5.76.52.92-u1210_64bit-75396/bin/via_chrome9_dri.so
}

package_via-chrome9-dri() {
	cd "$srcdir/ubuntu-12.10-unified_gfx_driver_Linux_5-76-52-92_006-75396"

	install -dm755 "${pkgdir}/usr/lib/xorg/modules/dri"

	# install driver for the appropriate architecture
	if [ $CARCH == x86_64 ]; then
		install -m755 "U12.10_64bit/mesa8.1/via_chrome9_dri.so" \
			"${pkgdir}/usr/lib/xorg/modules/dri/"
	else
		install -m755 "U12.10_32bit/mesa8.1/via_chrome9_dri.so" \
			"${pkgdir}/usr/lib/xorg/modules/dri/"
	fi
}

package_lib32-via-chrome9-dri() {
	cd "$srcdir/ubuntu-12.10-unified_gfx_driver_Linux_5-76-52-92_006-75396"

	install -dm755 "${pkgdir}/usr/lib32/xorg/modules/dri"

	# install driver for the i686 architecture
	install -m755 "U12.10_32bit/mesa8.1/via_chrome9_dri.so" \
		"${pkgdir}/usr/lib32/xorg/modules/dri/"
}
