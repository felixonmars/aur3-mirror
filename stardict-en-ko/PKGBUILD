# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-en-ko
pkgver=2.4.2
pkgrel=1
pkgdesc="English to Korean dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-KoreanEnglishDic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('4fbed88da49957df0a798d7f8abb85ce')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-KoreanEnglishDic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/KoreanEnglishDic
}


