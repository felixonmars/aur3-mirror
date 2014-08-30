# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=eod-client
pkgver=13.8.3
pkgrel=1
pkgdesc="Exceed on Demand Client from OpenText"
arch=('i686' 'x86_64')
license=('GPL')
url='http://connectivity.opentext.com/products/exceed-ondemand-linux-installation-instructions.aspx'
groups=()
source=("http://aur.causal.ca/src/eodclient8-${pkgver}-linux-i586.tar.gz")
package()
{
	cd ${srcdir}/Exceed_onDemand_Client_8
	mkdir -p ${pkgdir}/opt/eod
	mkdir -p ${pkgdir}/usr/bin
	cp -r * ${pkgdir}/opt/eod/.
	ln -s /opt/eod/eodxc ${pkgdir}/usr/bin/eodxc
}
#
md5sums=('98dd9a9215f350445fba8d016bfdbbed')
