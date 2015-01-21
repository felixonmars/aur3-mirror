# Maintainer: Mikolaj Romel <dev@mail.pokemony.be>

pkgname=batclient
pkgver=1.99
pkgrel=2
pkgdesc='Official BatMUD client written in Java.'
arch=('i686' 'x86_64')
url="http://www.bat.org/play/batclient"
license=('custom')
depends=(jre7)

source=('http://www.bat.org/batclient/batclient.jnlp'
	'batclient')

md5sums=('d68c6183abfe96744b5e12e972b8e767'
         '37ba318620aaa963fcd3baabd3895431')

package() {
	cd ${srcdir}

	install -Dm644 ${pkgname}.jnlp ${pkgdir}/opt/${pkgname}/${pkgname}.jnlp
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}	
