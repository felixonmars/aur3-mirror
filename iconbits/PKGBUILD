# PKGBUILD
pkgname=iconbits
pkgver=1
pkgrel=1
license=('custom')
arch=('i686' 'x86_64')
pkgdesc="More useless symbol fonts from urbanfonts.com"
url="http://www.urbanfonts.com/fonts/IconBitOne.htm"
source=("http://www.urbanfonts.com/scripts/index.php?iconbit.zip" "iconbitone.install")
install=iconbitone.install
md5sums=("b71c95ec9b70e7ad7c6ac38dbbcef529" "a1a8cdd720dc8b3e1129714b72440610")

build() {
	mkdir -p $startdir/pkg/usr/share/fonts/TTF
	mv $startdir/src/*.ttf $startdir/pkg/usr/share/fonts/TTF
}
