# Maintainer: Sigurd Næss <sigurdkn@reverse(on.oiu.ortsa)>
pkgname=cosmomad
pkgver=0.10
pkgrel=1
pkgdesc="Computes 0th order cosmology based on cosmological parameters."
arch=('i686' 'x86_64')
url="http://members.ift.uam-csic.es/dmonge/Software.html"
depends=(gcc-libs)
license=('GPL')
options=(!libtool)
source=("http://members.ift.uam-csic.es/dmonge/data/CosmoMad/cosmomad-${pkgver}.tar.gz")
md5sums=('b9b9f4814a87e724f6ad18fa9005a436')

build() {
	cd $srcdir/cosmomad-${pkgver}
	./configure --prefix=${pkgdir}/usr
	make install
}
