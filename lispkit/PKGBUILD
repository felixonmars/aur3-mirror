# submitter: perlawk
# Maintainer: perlawk

pkgname=lispkit
pkgver=1.0
pkgrel=1
pkgdesc='An implementation in C of the Lispkit described in the book "Functional Programming: Application and Implementation", by Peter Henderson.'
url="https://bitbucket.org/carldouglas/lispkit"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
install=
gitsrc=https://bitbucket.org/carldouglas/lispkit.git

prepare() {
	cd "$srcdir"
	if [ ! -e $pkgname ]; then
		#git clone https://github.com/tmishra/lispkit.git lispkit
		git clone $gitsrc
		cd $pkgname
		sed -i "s!^PREFIX.*!PREFIX = $pkgdir/usr!" Makefile
		sed -i 's!COMPILER=$(PREFIX)!COMPILER=/usr!' Makefile
	fi
}
 
build() {
	cd "$srcdir"/$pkgname
  make 
}
 
package() {
	cd "$srcdir"/$pkgname
	mkdir -p "$pkgdir"/usr/bin
	make install
}

