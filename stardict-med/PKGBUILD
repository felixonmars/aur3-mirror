# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-med
pkgver=2.4.2
pkgrel=1
pkgdesc="Korean Medical dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-KoreanMedicalDic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('0468214fd2820957e471ca458f7361e0')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-KoreanMedicalDic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/KoreanMedicalDic
}


