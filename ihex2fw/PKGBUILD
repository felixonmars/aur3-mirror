# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=ihex2fw
pkgver=20120907
pkgrel=1
pkgdesc='Parser/loader for IHEX formatted data.'
arch=('i686' 'x86_64')
url='http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=blob_plain;f=firmware/ihex2fw.c'
license=('GPL2')
source=('http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=blob_plain;f=firmware/ihex2fw.c')
md5sums=('4b1ef3e4ed575246ec40bbb6214c587b')

build() {
	cd $srcdir
	cc ihex2fw.c -o ihex2fw
}

package() {
	cd $srcdir
	install -D ihex2fw $pkgdir/usr/bin/ihex2fw
}
