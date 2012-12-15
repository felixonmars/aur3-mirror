# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-vi-en
pkgver=1.0
pkgrel=1
pkgdesc="OVDP Vietnamese to English dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-vietnamese-english-stardict_20080116-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-vietnamese-english-stardict/ovdp-vietnamese-english-stardict_20080116-1~uvn1_all.deb')
md5sums=('c651e10998bc314f0600f117a8c69e6e')


package() {
	cd $srcdir
	ar x ovdp-vietnamese-english-stardict_20080116-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
