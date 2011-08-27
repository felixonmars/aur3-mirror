# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-ko-law
pkgver=2.4.2
pkgrel=1
pkgdesc="Korean Law dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-KoreanLawDic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('cb2c0a02fc23400cc637e4a70a22d41d')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-KoreanLawDic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/KoreanLawDic
}


