# Contributer: giacomogiorgianni@gmail.com

pkgname=power-commands
pkgver=0.0.1.4
pkgrel=1
pkgdesc="Dash-unity--Commands to shutdown PC"
arch=('any')
url="https://launchpad.net/~atareao/+archive/test"
depends=('python>=2.7')
makedepends=('')
license=('GPL')
source=http://ppa.launchpad.net/atareao/test/ubuntu/pool/main/p/${pkgname}/${pkgname}_${pkgver}-1ubuntu1_all.deb
md5sums=('ee1e59add54082dd39417253ab57b9cd')
       
build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/data_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
}
