# Contributor: 

pkgname=stardict-langdao-ce-tc
pkgver=2.4.2
pkgrel=1
pkgdesc="Traditional Chinese <-> English dictionary for stardict - 正體字朗道字典 (Langdao)."
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_TW/stardict-langdao-ec-big5-2.4.2.tar.bz2
        http://www.huzheng.org/stardict-iso/stardict-dic/zh_TW/stardict-langdao-ce-big5-2.4.2.tar.bz2)
md5sums=('61ceeec1b056a171645af723d3e956fe'
         '50b9423fa578988b5b0544c5b663058a')
arch=('any')

build() {
	mkdir -p $startdir/pkg/usr/share/stardict/dic/

	cd $startdir/src/stardict-langdao-ce-big5-$pkgver
	install -m 644 langdao-ce-big5.dict.dz    $startdir/pkg/usr/share/stardict/dic/
	install -m 644 langdao-ce-big5.idx        $startdir/pkg/usr/share/stardict/dic/
	install -m 644 langdao-ce-big5.ifo        $startdir/pkg/usr/share/stardict/dic/

	cd $startdir/src/stardict-langdao-ec-big5-$pkgver
	install -m 644 langdao-ec-big5.dict.dz    $startdir/pkg/usr/share/stardict/dic/
	install -m 644 langdao-ec-big5.idx        $startdir/pkg/usr/share/stardict/dic/
	install -m 644 langdao-ec-big5.ifo        $startdir/pkg/usr/share/stardict/dic/

}
