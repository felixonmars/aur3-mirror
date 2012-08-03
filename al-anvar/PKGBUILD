# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: neo14515  <neo14515@gmail.com>

pkgname=al-anvar
pkgver=0.4.0
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
md5sums=('d8f47140ee5e53c8a8b0d7f4dae10cb0')
