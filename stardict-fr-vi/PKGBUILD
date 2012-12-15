# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-fr-vi
pkgver=1.0
pkgrel=1
pkgdesc="OVDP French to Vietnamese dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-french-vietnamese-stardict_20070706-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-french-vietnamese-stardict/ovdp-french-vietnamese-stardict_20070706-1~uvn1_all.deb')
md5sums=('803e058e99ce90c21c384e42c93fedf7')


package() {
	cd $srcdir
	ar x ovdp-french-vietnamese-stardict_20070706-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
