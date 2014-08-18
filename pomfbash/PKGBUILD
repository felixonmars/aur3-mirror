# Contributor: Frank LENORMAND <lenormf@gmail.com>

pkgname=pomfbash
pkgver=1
pkgrel=1
pkgdesc="Upload your files to a website running Pomf from the CLI"
arch=("any")
license=("MIT")
url="https://github.com/lenormf/pomfbash"
depends=("bash" "curl")
optdepends=("xsel: XSel is a command-line program for getting and setting the contents of the X selection")
source=("https://raw.githubusercontent.com/lenormf/pomfbash/master/pomfbash")
sha1sums=("13ce04dc4c7cd53ead1348be26156cfe2de7cb67")

build() {
	mkdir -p $pkgdir/usr/bin
	install pomfbash $pkgdir/usr/bin/pomfbash -m 755 || return 1
}
