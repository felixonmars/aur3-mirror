# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Maintainer: stef312 <stef312_at_gmail_dot_com>
# Maintainer: Gaspar de Elías <caspercba_at_hotmail_dot_com>
# Maintainer: Artem Sheremet <dot_doom_at_gmail_dot_com>

pkgname=wync
pkgver=2.0.328
pkgrel=1
if test "$CARCH" == x86_64; then
	_arch=64
elif test "$CARCH" == i686; then
	_arch=32
fi
pkgdesc="Microsoft Lync client for Linux"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2014 Fisil LLC"')
depends=('curl' 'ffmpeg-compat' 'gtk2' 'nss' 'qt5-multimedia' 'libxss' 'qt5-quick1' 'qt5-svg' 'postgresql-libs' 'libxkbfile' 'libxmu' 'libxss')
makedepends=('chrpath')
url="http://fisil.com/linuxlync.html"
install="${pkgname}.install"
source=('wync.conf'
				'LICENSE')
source_x86_64=("http://fisil.com/linux/wync_ubuntu64_v${pkgver}.deb")
source_i686=("http://fisil.com/linux/wync_ubuntu32_v2.0.310.deb")
sha256sums=('c66fc39d071e1595a6cf94a7db566555a40596a8db1eb2bb4d428f692c1d6a17'
            '53f44cbf22b57f2c93973ee2857ea896ffbd62d49f71c8900487f40381b53521')
sha256sums_x86_64=('1a918240cf5ec56bfe54b803f7c4d30461f23bcce325a05f2a8a702ce90c3acf')
sha256sums_i686=('3d5c587d948ff630f14b971373015ac7be661b10e255c54f0c77d165b016e89c')

package() {
	cd "${srcdir}"
	ar x "wync_ubuntu${_arch}_v${pkgver}.deb" >/dev/null
	tar -xzf data.tar.gz

  cp -rf "${srcdir}/opt" "${pkgdir}/"
  cp -rf "${srcdir}/usr" "${pkgdir}/"
  cp -rf "${srcdir}/etc" "${pkgdir}/"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s /opt/wync_linux/wync.sh "${pkgdir}/usr/bin/wync"

	# Fix .desktop file
	sed -i 's/sh \/opt\/wync_linux\/wync.sh/\/usr\/bin\/wync/' "${srcdir}/usr/share/applications/wync.desktop"
	install -Dm 644 "${srcdir}/usr/share/applications/wync.desktop" "${pkgdir}/usr/share/applications/wync.desktop"

	cp -rf "${srcdir}/opt/wync_linux/sounds" "${pkgdir}/opt/wync_linux/"

	# Remove RPATHs
	chrpath -d "${pkgdir}/opt/wync_linux/wync"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libsipw.so.1.0.0"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicudata.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicutest.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicule.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicutu.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicui18n.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libiculx.so.52.1"
	chrpath -d "${pkgdir}/opt/wync_linux/lib/libicuio.so.52.1"

  install -Dm 644 wync.conf "${pkgdir}/etc/ld.so.conf.d/wync.conf"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/wync/LICENSE"

  # Remove incorectly packaged library
	rm -f "${pkgdir}/opt/wync_linux/lib/libXss.so"
	rm -f "${pkgdir}/opt/wync_linux/lib/libXss.so.1"
	rm -f "${pkgdir}/opt/wync_linux/lib/libXss.so.1.0.0"
}

# vim: set ts=2 sw=2 ft=sh noet:
