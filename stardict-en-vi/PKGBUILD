# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-en-vi
pkgver=1.0
pkgrel=1
pkgdesc="OVDP English to Vietnamese dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-english-vietnamese-stardict_20090805-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-english-vietnamese-stardict/ovdp-english-vietnamese-stardict_20090805-1~uvn1_all.deb')
md5sums=('07a83ca66665a6f95f3cfdc35cfcf3c2')


package() {
	cd $srcdir
	ar x ovdp-english-vietnamese-stardict_20090805-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
