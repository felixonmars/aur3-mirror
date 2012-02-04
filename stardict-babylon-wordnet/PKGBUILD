# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=stardict-babylon-wordnet
pkgver=2.4.2
pkgrel=3
pkgdesc="Babylon WordNet English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('9cd540cc9cc93ff89ad8a741b0d906ce')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/babylon/en/stardict-babylon-WordNet-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-WordNet-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
