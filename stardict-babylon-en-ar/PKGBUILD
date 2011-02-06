# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=stardict-babylon-en-ar
pkgver=2.4.2
pkgrel=3
pkgdesc="Babylon English Arabic dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('7bbf2446ce3ba108837897618e05712c')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/babylon/bidirectional/stardict-babylon-Babylon_English_Arabic-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-Babylon_English_Arabic-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
