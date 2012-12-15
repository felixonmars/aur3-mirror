# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-zh-vi
pkgver=1.0
pkgrel=1
pkgdesc="OVDP Chinese to Vietnamese dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-chinese-vietnamese-stardict_20070706-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-chinese-vietnamese-stardict/ovdp-chinese-vietnamese-stardict_20070706-1~uvn1_all.deb')
md5sums=('258f616c244d3f66ba2a3b27ae88a1c0')


package() {
	cd $srcdir
	ar x ovdp-chinese-vietnamese-stardict_20070706-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
