# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-vi-fr
pkgver=1.0
pkgrel=1
pkgdesc="OVDP Vietnamese to French dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-vietnamese-french-stardict_20070706-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-vietnamese-french-stardict/ovdp-vietnamese-french-stardict_20070706-1~uvn1_all.deb')
md5sums=('a01a4b0e2741ed7f8c25ab65a1955287')


package() {
	cd $srcdir
	ar x ovdp-vietnamese-french-stardict_20070706-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
