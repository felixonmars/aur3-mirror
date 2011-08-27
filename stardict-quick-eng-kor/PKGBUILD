# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-quick-eng-kor
pkgver=2.4.2
pkgrel=1
pkgdesc="Quick English to Korean dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-quick_eng-kor-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('6542781e4a3a18baf74501da60b5070f')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-quick_eng-kor-$pkgver/ $startdir/pkg/usr/share/stardict/dic/stardict-quick_eng-kor
}

