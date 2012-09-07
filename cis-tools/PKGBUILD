# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=cis-tools
pkgver=20120908
pkgrel=1
pkgdesc='CIS file tools from pcmcia-cs'
arch=('i686' 'x86_64')
url='http://git.kernel.org/pub/scm/utils/cis-tools/cis-tools.git'
license=('MPL' 'GPL2')

build() {
	cd $srcdir
	git clone $url
	cd $pkgname
	make
}

package() {
	cd $srcdir/$pkgname
	make PREFIX=$pkgdir install
}
