# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=textadept-pkgbuild-module
pkgver=0.3
pkgrel=2
pkgdesc="A module to help you edit PKGBUILD's in Textadept"
arch=('any')
url="http://caladbolg.net/textadeptwiki/index.php?n=Main.Pkgbuild-module"
license=('public domain')
depends=('textadept')
source=(http://caladbolg.net/textadeptwiki/uploads/pkgbuild-module-${pkgver}.tar.gz)
md5sums=('dec7a004bf331163444894a62a66223d')

build() {
	cd "$srcdir"

  mkdir -p ${pkgdir}/usr/share/textadept/modules/pkgbuild
	cp ./*.lua ${pkgdir}/usr/share/textadept/modules/pkgbuild
}
