# Based on cnijfilter-ip2600 package
# Contributor: Dimuls dimuls@gmail.com
pkgname=cnijfilter-ip2600
pkgver=2.90
pkgrel=1
pkgdesc="Canon printer driver for Pixma i2600"
url="http://software.canon-europe.com/software/0031332.asp"
arch=('i686' )
license=('custom')
depends=('libcups' 'popt' 'libpng12')
makedepends=('rpmextract')
source=('http://gdlp01.c-wss.com/gds/6/0100001186/01/cnijfilter-common-2.90-1.i386.rpm'
	'http://gdlp01.c-wss.com/gds/8/0100001188/01/cnijfilter-ip2600series-2.90-1.i386.rpm')
md5sums=('c03ed6488910b692b02060b08139de25'
	 'e0fa9dae1e732bc55a79e8f78c625385')

build() {
	cd $pkgdir
	rpmextract.sh $srcdir/cnijfilter-common-2.90-1.i386.rpm  
	rpmextract.sh $srcdir/cnijfilter-ip2600series-2.90-1.i386.rpm
	chmod -R a+rX usr/
	}