# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-koreandic
pkgver=2.4.2
pkgrel=1
pkgdesc="Korean dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-KoreanDic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('fb871b58fb0305af3cb4442cbfcc5055')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-KoreanDic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/stardict-koreaDic
}


