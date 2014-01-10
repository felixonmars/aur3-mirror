# Maintainer: m0rph <m0rph.mailbox@gmail.com> 

pkgname=cereal-git
pkgver=v0.9.1.r0.g8af4468
pkgrel=1
pkgdesc="A C++11 library for serialization"
arch=('any')
url="https://github.com/falconindy/expac"
license=('BSD')
makedepends=('git')
source=('git+https://github.com/USCiLab/cereal.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/cereal"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
	cd "$srcdir/cereal"
	mkdir -p "$pkgdir/usr/include"
	cp -r "$srcdir/cereal/include/cereal" "$pkgdir/usr/include"
}
