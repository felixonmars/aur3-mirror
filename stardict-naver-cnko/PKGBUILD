# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-naver-cnko
pkgver=2.4.2
pkgrel=1
pkgdesc="Naver Chinese<->Korean dictionary for Stardict."
arch=('any')
url="http://stardict.sourceforge.net"
license=('custom: "free to use"')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/stardict-naver_cnkr-$pkgver.tar.bz2
http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/stardict-naver_krcn-$pkgver.tar.bz2)

md5sums=('321acb984d67bf01faf42dc5243076d9'
         '2520f969edb3a31031277b463fe18c6e')
build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-naver_cnkr-$pkgver/Naver_CnKr.dict.dz \
$startdir/src/stardict-naver_cnkr-$pkgver/Naver_CnKr.idx \
$startdir/src/stardict-naver_cnkr-$pkgver/Naver_CnKr.ifo \
$startdir/src/stardict-naver_krcn-$pkgver/Naver_KrCn.dict.dz \
$startdir/src/stardict-naver_krcn-$pkgver/Naver_KrCn.idx \
$startdir/src/stardict-naver_krcn-$pkgver/Naver_KrCn.ifo \
$startdir/pkg/usr/share/stardict/dic/

}
