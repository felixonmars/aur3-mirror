# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-quick-enko
pkgver=2.4.2
pkgrel=1
pkgdesc="Quick English<->Korean dictionary for Stardict"
license=('custom: "free to use"')
arch=('any')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://www.huzheng.org/stardict-iso/stardict-dic/ko/stardict-quick_eng-kor-$pkgver.tar.bz2
http://www.huzheng.org/stardict-iso/stardict-dic/ko/stardict-quick_kor-eng-$pkgver.tar.bz2)
md5sums=('6542781e4a3a18baf74501da60b5070f'
         '52015d203a9e4afd394949939875ed10')
build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-quick_eng-kor-$pkgver/quick_english-korean.dict.dz \
$startdir/src/stardict-quick_eng-kor-$pkgver/quick_english-korean.idx \
$startdir/src/stardict-quick_eng-kor-$pkgver/quick_english-korean.ifo \
$startdir/src/stardict-quick_kor-eng-$pkgver/quick_kor-eng.dict.dz \
$startdir/src/stardict-quick_kor-eng-$pkgver/quick_kor-eng.idx \
$startdir/src/stardict-quick_kor-eng-$pkgver/quick_kor-eng.ifo \
$startdir/pkg/usr/share/stardict/dic/

}
