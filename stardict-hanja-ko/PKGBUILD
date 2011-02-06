# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-hanja-ko
pkgver=2.4.2
pkgrel=1
pkgdesc="Hanja(Korean Hanzi) dictionary for Stardict"
license=('free to use')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-Hanja_KoreanHanzi_Dic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('556972856991cdddd8d7dc63a2b4a16b')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-Hanja_KoreanHanzi_Dic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/stardict-Hanja_KoreanHanzi_Dic
}


