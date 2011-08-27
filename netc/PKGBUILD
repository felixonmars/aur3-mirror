# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=netc
pkgver=0.2.0
pkgrel=1
pkgdesc="Serverless multi-platform LAN chat"
arch=('i686' 'x86_64')
url="http://dgtalize.com/products/netc"
license=('gpl')
depends=('java-runtime' 'sh')
source=(http://downloads.sourceforge.net/netc/${pkgname}-${pkgver}.tar netc.sh)
md5sums=('029e30c5dc0be5df13eec1983d0d39d4'
	 '1c125d0c6f316c729a65619dd0ca9181') 

build() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/share/java/${pkgname} || return 1
	cp -rf README.TXT changes.txt config.xml lib/ license.txt netclogo.ico smiles/ \
		smiles.xml userList.xml NetC.jar ${pkgdir}/usr/share/java/${pkgname}/ || return 1
   	install -Dm755 netc.sh ${pkgdir}/usr/bin/netc
   
}

