# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Daniel Griffiths <ghost1227@archlinux.us>
# Contributor: Chaniyth <chaniyth@yahoo.com>
# Contributor: Allen <allencch at hotmail dot com>

pkgname=jondo
pkgver=00.19.001
pkgrel=3
pkgdesc='Redirects internet traffic trough a mix of proxy servers to hide the origin of the requests'
arch=('any')
license=('BSD')
url='https://anonymous-proxy-servers.net/'
depends=('java-environment')
install="${pkgname}.install"
source=('https://anonymous-proxy-servers.net/downloads/jondo_linux.tar.bz2'
		'https://anonymous-proxy-servers.net/downloads/jondo_linux.tar.bz2.asc'
		'jondo'
		'jondo.1'
		'licence')
sha256sums=('68fc519960c788ba5a36c3ef4871088d669f7d2ffcaf77cc8b4df25505233e33'
			'eec717043dcaf5f2fd03b3f81744b3ad8f7e3aac6dd4418cce7679c8b427ec00'
            '0a25c9f3ad376ea6b3c3ec87d7b6a534a30270e77ff1fc8b8c936f83f1d8df03'
            '8e5f582e5f6e64d7b134110f4475d5a8679cd0f2c1d5538f5b970ae0f8b3d24c'
            '9c7de55f80fd78ef6f8d39fa0309defbc42ac848c2c9f5a995901326a1a43e8d')
package() {
	cd $srcdir/

	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
	install -Dm644 licence ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE

	cd jondo_linux/
  echo 'Exec=jondo' >> desktop/${pkgname}.desktop
  
	install -Dm644 JAP.jar ${pkgdir}/usr/share/java/${pkgname}/JAP.jar
	install -Dm644 desktop/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 desktop/${pkgname}.menu ${pkgdir}/usr/share/menu/${pkgname}.menu
	install -Dm644 icons/${pkgname}-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}

# vim:set ts=2 sw=2 et:
