pkgname=mcclient
pkgver=0.4
pkgrel=2
pkgdesc="MCCP client"
arch=('i686' 'x68_64')
url="http://mccp.smaugmuds.org/clients.html"
license=('GPL')
source=("http://mccp.smaugmuds.org/${pkgname}-${pkgver}.zip")
md5sums=('7a28f2c8ad74d3bb97ea726d51026a25')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i "s|mcclient\.cfg|${sysconfdir}/mcclient.cfg|" *.{c,h}
	make
}

package() {
	mkdir -p ${pkgdir}/usr/bin/mcclient
	cp ${srcdir}/${pkgname}-${pkgver}/linux/mcclient ${pkgdir}/usr/bin/mcclient
}
