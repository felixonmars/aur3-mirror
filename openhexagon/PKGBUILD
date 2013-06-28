# Maintainer: Johannes Löthberg <demizide@gmail.com>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openhexagon
pkgver=1.92
pkgrel=1
pkgdesc="C++ open source clone of Super Hexagon. (binary)"
arch=('i686' 'x86_64')
url="http://vittorioromeo.info/projects.html"
options=(!strip)
license=('custom:AFL')
depends=('lua51')
source=(http://vittorioromeo.info/Downloads/OpenHexagon/Linux/OpenHexagonV1.92.tar.gz
	https://raw.github.com/SuperV1234/SSVOpenHexagon/master/LICENSE)
md5sums=('bda07a9d91a9dd8538d9a7a26562de69'
         '808282b4d6cf58dacf16fae6068bd030')
package() {
	install -Dd "${pkgdir}/opt/OpenHexagon1.92"
	cp -r ${srcdir}/OpenHexagon1.92/ ${pkgdir}/opt/
	
	install -Dd ${pkgdir}/usr/bin
	ln -s /opt/OpenHexagon1.92/OpenHexagon ${pkgdir}/usr/bin/openhexagon
	
	# need world writeable Profiles for creating profiles and config for... config
	chmod 777 ${pkgdir}/opt/OpenHexagon1.92/{Profiles,config.json}

	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
