# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A good extension for xinit, similar to CDM."
url=https://code.google.com/p/t-display-manager/
arch=('any')
pkgver=0.4.0
pkgrel=1
license=('GPL3')
depends=('xorg-xinit')
optdepends=('dialog: for curses UI')
source=("http://t-display-manager.googlecode.com/git/packages/tdm-${pkgver}.tar.xz")
install=tdm.install

build() {
	true
}

package(){
	cd $srcdir/tdm
	make PREFIX=/usr DESTDIR=${pkgdir} install
}

md5sums=(
'3a5e7c16fea2dc1ea5c62e838374ee2d'
)

