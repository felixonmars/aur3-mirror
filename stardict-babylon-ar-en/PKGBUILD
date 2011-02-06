# Contributor: Chen Xing <cxcxcxcx@gmail.com>

pkgname=stardict-babylon-ar-en
pkgver=2.4.2
pkgrel=4
pkgdesc="Babylon Arabic English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('a3b03f30090505dbbca8d797696bef86')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/babylon/bidirectional/stardict-babylon-Babylon_Arabic_English-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-Babylon_Arabic_English-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
