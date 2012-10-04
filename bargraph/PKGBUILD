# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=bargraph
pkgver=4.7
pkgrel=1
pkgdesc='Clustered/Stacked Filled Bar Graph Generator'
arch=('any')
url="http://www.burningcutlery.com/derek/bargraph"
license=('GPL2')
depends=('perl' 'imagemagick' 'transfig' 'ghostscript')
options=('!strip')
source=("http://bargraphgen.googlecode.com/files/bargraphgen-${pkgver}.tgz")
sha1sums=('d527e8bc59262dceec9243ad70fa8641ee2f8df2')

package() {
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin/"
  sed -i 's|BARGRAPH := ../bargraph.pl|BARGRAPH := /usr/bin/bargraph|' "${srcdir}/samples/Makefile"
  mv "${srcdir}/samples" "${pkgdir}/usr/share/doc/${pkgname}/"
  mv "${srcdir}/bargraph.pl" "${pkgdir}/usr/bin/bargraph"
  chmod -R a+rX "${pkgdir}"
}

build() {
  cd "${srcdir}/samples"
  sed -i 's|OUTDIR := ../../build/samples|OUTDIR := ./|' Makefile
  rm -f *.png
  make
}
