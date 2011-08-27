# Spicebird: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Tilman Bartsch <tba@timaba.de>
# Contributor: Roberto Viola <cagnulein@tin.it>

realname=spicebird
pkgname=${realname}-bin
pkgver=0.8
pkgrel=1
pkgdesc="A collaboration client that provides integrated access to email, contacts, calendaring and instant messaging in a single application"
arch=("i686" "x86_64")
url="http://www.${realname}.com/"
license=("GPL" "LGPL" "MPL")
depends=("libxt" "nss" "dbus-glib" "popt")
provides=("${realname}")
options=(!emptydirs)

source=(http://files.${realname}.org/pub/${realname}.org/${realname}/releases/${pkgver}/linux-${CARCH}/en-US/${realname}-${pkgver}.en-US.linux-${CARCH}.tar.bz2)
sha1sums=('091c5ad1f6fc3dc3c8bc4ce71e0f2e73d11100b2')

build() {
	cd ${srcdir}/${realname}

	# Removals
	# Libs provided by nspr
	rm libnspr4.so libplc4.so libplds4.so

	# Directories
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/{applications,pixmaps,${realname}}

	# Install
	cp -r ${srcdir}/${realname}/* ${pkgdir}/usr/share/${realname}/
	ln -s /usr/share/${realname}/${realname} ${pkgdir}/usr/bin/

	# Desktop
	install -m644 ${srcdir}/${realname}/icons/mozicon50.xpm  ${pkgdir}/usr/share/pixmaps/${realname}.xpm
	#install -m644 ${startdir}/extra/${realname}.desktop ${pkgdir}/usr/share/applications/
}

