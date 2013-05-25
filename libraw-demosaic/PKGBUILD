# Maintainer: rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com
#
# Adds license incompatible (to the base libraw package) interpolation (demosaic) methods
# contained in LibRaw-demosaic-pack-GPL2 and LibRaw-demosaic-pack-GPL3
#
pkgname=libraw-demosaic
pkgver=0.14.8
pkgrel=1
pkgdesc="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others). Includes demosaic packs"
arch=('i686' 'x86_64')
url="http://www.libraw.org/"
license=('CDDL' 'LGPL' 'custom' 'GPL2' 'GPL3')
depends=('lcms')
provides=('libraw')
conflics=('libraw')
source=("http://www.libraw.org/data/LibRaw-${pkgver}.tar.gz"
		"http://www.libraw.org/data/LibRaw-demosaic-pack-GPL2-${pkgver}.tar.gz"
		"http://www.libraw.org/data/LibRaw-demosaic-pack-GPL3-${pkgver}.tar.gz")
sha256sums=('ec06bfb31ccefc8618c3939aa99fa7a42b413e0ccfb24205bb7fe7eaa4ba13ac'
            'd65f91e7c18de2a34aa0c7bcbae4ee52b75dc26d8d3cdc3fcaa00b065a58bf30'
            '8a142b7fbe4629c7e65302945bb9d20ab09f28143a61a400199fba6a0df84f3d')

build() {
  cd ${srcdir}/LibRaw-${pkgver}

  ./configure --prefix=/usr \
	--enable-demosaic-pack-gpl2="../LibRaw-demosaic-pack-GPL2-${pkgver}" \
	--enable-demosaic-pack-gpl3="../LibRaw-demosaic-pack-GPL3-${pkgver}"
  make
}

package() {
  cd ${srcdir}/LibRaw-${pkgver}

  make DESTDIR=${pkgdir} install
  
#license
  install -D -m644 ${srcdir}/LibRaw-${pkgver}/LICENSE.LibRaw.pdf \
    ${pkgdir}/usr/share/licenses/libraw/LICENSE.LibRaw.pdf
}
