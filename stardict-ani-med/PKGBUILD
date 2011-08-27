# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-ani-med
pkgver=2.4.2
pkgrel=1
pkgdesc="Korean Animal Medical dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-KoreanAnimalMedicalDic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('46fd156c3986b8d48cbd43891e324511')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-KoreanAnimalMedicalDic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/KoreanAnimalMedicalDic
}


