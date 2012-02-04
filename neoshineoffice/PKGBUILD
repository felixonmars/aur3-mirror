pkgname=neoshineoffice
pkgver=5.0
pkgrel=1
pkgdesc="Neoshine Office中标普华Office 5.0个人版"
arch=('any')
url="http://www.cs2c.com.cn/"
license=('GPL')
makedepends=(rpmextract)
depends=()
source=(ftp://59.108.119.3/neoshine/office/3.0.2/iso/neoshineoffice5linux.tar.gz)
md5sums=('be6d3bc7738969b7e14032a74d46b14d')
conflicts=()
install=neoshineoffice5linux.install
provides=('S2C')

build() {
	cd ${startdir}/src/zh-CN/RPMS/
	for i in *.rpm; do rpmextract.sh $i ; done;
	rpmextract.sh desktop-integration/*freedesktop-menus*.rpm;
	mv {opt/,usr/} ${startdir}/pkg/ ;

}

