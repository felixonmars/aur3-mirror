# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=tucnak2
pkgver=2.47
pkgrel=1
pkgdesc="The VHF contest logbook: support of most EU contests; export to EDI, ADIF, HTML; record contest to WAV file"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz"
license=('GPL')
depends=('glib2' 'sdl' 'gpm' 'libpng' 'libsndfile' 'alsa-lib' 'libftdi' 'hamlib' 'fftw')
makedepends=('pkg-config')
source=(${url}/${pkgname}-${pkgver}.tar.gz tucnak2.desktop)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install

	# Overwrite desktop file
	cp ../${pkgname}.desktop $pkgdir/usr/share/applications
}

md5sums=('cf2ed1fdc5b4185550f51cdb87b3d566'
         'f596b3dcbb1228239385e020180dda2b')
sha256sums=('229d245f5fc7c50a2ef426fe279e773d86b93dd28388c1c06f0acb877683df8e'
            '9f722aa0ff0bdbead32d08483f57a617c442524abd584aea97ac6e7e18cabc01')
