# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=al-anvar
pkgver=0.3.5
pkgrel=1
pkgdesc="open source freeware software for study Quran ( koran ) and research "
arch=('i686' 'x86_64')
url="http://al-anvar.sourceforge.net/"
license=('GPL')
depends=('qt' 'phonon')
makedepends=('qt' 'phonon')
options=('!strip')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/src-${pkgname}-${pkgver}.tar.gz")

build() {
	tar xf src-${pkgname}-${pkgver}.tar.gz

	cd src-${pkgname}-${pkgver}

 qmake

  make
}

package() {
	cd src-${pkgname}-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
md5sums=('fbd4b1b9076470aaa988694778b17520')
