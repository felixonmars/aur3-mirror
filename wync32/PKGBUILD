# Maintainer: stef312 <stef312_at_gmail_dot_com>
# Maintainer: Gaspar de Elías <caspercba_at_hotmail_dot_com>
# Maintainer: Artem Sheremet <dot_doom_at_gmail_dot_com>

pkgname=wync32
pkgver=2.0.90
pkgrel=1
_arch=32
pkgdesc="Microsoft Lync client for Linux"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2014 Fisil LLC"')
url="http://fisil.com/products.html"
options=('!strip' 'staticlibs')
md5sums=('d2fdd183d19a9ec1839429c13ba0c47d')
source=("http://fisil.com/linux/wync_ubuntu${_arch}_v${pkgver}.deb")
provides=('wync')
conflicts=('wync')

if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-v4l-utils' 'lib32-fontconfig' 'lib32-libxv' 'lib32-alsa-lib' 'lib32-nspr' 'lib32-libxinerama' 'lib32-gstreamer0.10-base-plugins'
	         'lib32-sqlite' 'lib32-libxrandr' 'lib32-mesa' 'lib32-libxcursor' 'lib32-libpulse' 'lib32-openssl' 'lib32-libxkbfile')
elif [ "$CARCH" = "i686" ]; then
	depends=('libxkbfile' 'curl' 'gcc-libs-multilib' 'ffmpeg' 'gtk2' 'nss' 'qt5-webkit' 'qt5-multimedia')
fi


package() {
	cd "${srcdir}"
	ar x "wync_ubuntu${_arch}_v${pkgver}.deb" >/dev/null
	tar -xzf data.tar.gz -C "${pkgdir}"

	# Remove autorun xdg file
	rm -rf "${pkgdir}"/etc

	# Remove group/world-writable bit
	chmod -R go-w "${pkgdir}"/opt
	chmod -R go-w "${pkgdir}"/usr

	install -dm 755 "${pkgdir}"/usr/bin
	ln -s /opt/wync_linux/wync.sh "${pkgdir}"/usr/bin/wync
}
