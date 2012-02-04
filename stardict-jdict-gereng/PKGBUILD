# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-jdict-gereng
pkgver=2.4.2
pkgrel=1
pkgdesc="JDict German-English dictionary for Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/misc/stardict-jdict-GerEnglish-$pkgver.tar.bz2)
md5sums=('0b4ca1bdf4d99bcf8e9ae4a6837f6ab5')

build() {
    cd $srcdir/stardict-jdict-GerEnglish-$pkgver
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 jdict-GerEng.dict.dz jdict-GerEng.idx jdict-GerEng.ifo \
	$pkgdir/usr/share/stardict/dic/
}
