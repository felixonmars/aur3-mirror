# Maintainer: Andrew Kiss <ubervoltage@gmail.com>
pkgname=kspclicalc
pkgver=1.5
pkgrel=6
url="https://github.com/supervoltage/$pkgname"
pkgdesc="Kerbal Space Program calculator"
arch=('i686' 'x86_64')
license=('GPL')
groups=('libstdc++')
makedepends=('make')
options=()
source=("https://dl.dropboxusercontent.com/u/29712116/C%2B%2B/kspclicalc.tar.gz")
noextract=()
md5sums=('ea04107f145f9293acf9af7f2e8e5a48')

build() {
	cd $srcdir
	
	make
}

package() {
	cd $srcdir
	
	make DESTDIR="$pkgdir/" install
}