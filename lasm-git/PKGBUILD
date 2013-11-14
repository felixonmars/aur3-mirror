# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='lasm-git'
pkgver=0.0.0
pkgrel=1
pkgdesc='Reverse-engineering p86 assembler.'
arch=('i686' 'x86_64')
url='https://github.com/hasithvm/lasm'
license=('GPL3')
depends=('qt4')
makedepends=('git')
provides=('libra')
source=('git+https://github.com/hasithvm/lasm')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/lasm/"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build()
{
	cd "$srcdir/lasm/"
	make QMAKE=qmake-qt4
}

package()
{
	cd "$srcdir/lasm/"
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 bin/* "$pkgdir/usr/bin/"
}

