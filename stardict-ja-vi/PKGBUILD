# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgname=stardict-ja-vi
pkgver=1.0
pkgrel=1
pkgdesc="OVDP Japanese to Vietnamese dict (Stardict format)"
arch=('any')
url=('http://ovdp.sourceforge.net')
license="GPL"
depends=('stardict')
source=('ovdp-japanese-vietnamese-stardict_20070706-1~uvn1_all.deb::http://ppa.launchpad.net/ubuntu-vn/ppa/ubuntu/pool/main/o/ovdp-japanese-vietnamese-stardict/ovdp-japanese-vietnamese-stardict_20070706-1~uvn1_all.deb')
md5sums=('4316f08c97523c0e5e465d62445af284')


package() {
	cd $srcdir
	ar x ovdp-japanese-vietnamese-stardict_20070706-1~uvn1_all.deb
	tar xvf data.tar.gz
	cp -R usr $pkgdir
}
