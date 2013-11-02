# Submitter : perlawk
pkgname=clint
_pkgname=cl
pkgver=1.6
pkgrel=1
pkgdesc='cl: Combinatory Logic Interpreter'
url='http://stratigery.com/cl.html'
license=('GPL')
arch=('i686' 'x86_64')
options=(!strip)
source=("http://stratigery.com/$_pkgname-$pkgver.tar.gz")

build() {
		cd "$srcdir"/"$_pkgname-$pkgver"
		sed -i 's/-Wall/-Wall -O2/' makefile
    make gnu
}

package() {
		cd "$srcdir"/"$_pkgname-$pkgver"
		mkdir -p "$pkgdir"/usr/bin
		cp cl "$pkgdir"/usr/bin
}

md5sums=('f3338e6f2c738e4abbb40e11c0cb7122')
