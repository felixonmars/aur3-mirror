# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=ruby-oci8-compat
pkgver=2.1.2
pkgrel=2
pkgdesc="Compatibility package enabling out of the box installation of ruby-oci8 gem"
arch=('any')
url="http://ruby-oci8.rubyforge.org/"
license=('GPL')
depends=('oracle-instantclient-sdk')
makedepends=('')
source=()
md5sums=()


package() {
	mkdir -p $pkgdir/usr/lib/sdk/include
	ln -s \
		/usr/include/nzerror.h \
		/usr/include/nzt.h \
		/usr/include/occi.h \
		/usr/include/occiAQ.h \
		/usr/include/occiCommon.h \
		/usr/include/occiControl.h \
		/usr/include/occiData.h \
		/usr/include/occiObjects.h \
		/usr/include/oci.h \
		/usr/include/oci1.h \
		/usr/include/oci8dp.h \
		/usr/include/ociap.h \
		/usr/include/ociapr.h \
		/usr/include/ocidef.h \
		/usr/include/ocidem.h \
		/usr/include/ocidfn.h \
		/usr/include/ociextp.h \
		/usr/include/ocikpr.h \
		/usr/include/ocixmldb.h \
		/usr/include/ocixstream.h \
		/usr/include/odci.h \
		/usr/include/oratypes.h \
		/usr/include/ori.h \
		/usr/include/orid.h \
		/usr/include/orl.h \
		/usr/include/oro.h \
		/usr/include/ort.h \
		/usr/include/xa.h \
		$pkgdir/usr/lib/sdk/include
}
