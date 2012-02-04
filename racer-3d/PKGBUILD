# Contributor: Stefan Wilkens <stefanwilkens@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
#
# note: package was named to include "-3d" due to another package
# already being in the AUR with the name "racer". Update the
# source link if you update this PKGBUILD!

pkgname=racer-3d
pkgver=054b1
pkgrel=3
pkgdesc="3D car simulator with realistic physics and render engine"
arch=('i686' 'x86_64')
url="http://www.racer.nl/"
license=('custom')
[ "$CARCH" == "i686" ] && depends=('fmodex')
[ "$CARCH" == "x86_64" ] && depends=('lib32-fmodex')
source=(http://www.racer.nl/download/racer$pkgver.tgz racer-3d.desktop racer-3d.sh LICENSE)
md5sums=('a779d3cd4e5a282c2d08b7750ccd1c57'
         '4ebd14c858fe5abf535eb37fb7148189'
         '68af8419e3a1d381a12b1ac60e45e94a'
         '51a9cac34e83de7d9e60a598225f0967')

build() {
	# Extract
	cd ${srcdir}
	tar -zxvf racer${pkgver}.tgz
	
	# Install
	mkdir ${pkgdir}/opt
	cp -r "racer/" "${pkgdir}/opt/${pkgname}"
	
	# Allow people in the users group write access for config files
	chown root:users "${pkgdir}/opt/${pkgname}" -R
	chmod 774 "${pkgdir}/opt/${pkgname}" -R
	
	# Install script, desktop entry and licence
	install -Dm755 "${srcdir}/racer-3d.sh" "${pkgdir}/usr/bin/racer-3d"
	install -Dm644 "${srcdir}/racer-3d.desktop" "${pkgdir}/usr/share/applications/racer-3d.desktop"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}