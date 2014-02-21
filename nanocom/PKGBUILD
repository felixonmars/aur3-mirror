# Maintainer: stef312 <stef312_at_gmail_dot_com>

pkgname=nanocom
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight serial terminal program based upon microcom for Linux."
arch=('i686' 'x86_64')
url="http://nanocom.sourceforge.net/"
license=('GPLv2')
makedepends=(gcc)
source=(http://downloads.sourceforge.net/project/nanocom/nanocom/v$pkgver/nanocom.tar.gz)
md5sums=('e20c7babfed891b70b669123a30b5ad6')

build() {
	make
}

package() {
	mkdir -p $pkgdir/usr/local/bin
	install -D -m755 $srcdir/nanocom $pkgdir/usr/local/bin/
}
