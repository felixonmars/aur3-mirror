# Maintainer: dreieck
# Contributor: Mantas M. <grawity [at] gmail )dot) com>
pkgname=xorriso
pkgver=1.2.6
pkgrel=4
pkgdesc='ISO 9660 Rock Ridge filesystem manipulator. Includes '
arch=('i686' 'x86_64')
optdepends=('acl' 'attr' 'readline' 'zlib' 'bzip2')
          # "tcl: To use the GUI 'xorriso-tcltk'." "tk=>8.4: To use the GUI 'xorriso-tcltk'." "bwidget: To use the GUI 'xorriso-tcltk'."
# provides=("xorriso-tcltk=${pkgver}")
# conflicts=("xorriso-tcltk")
url="http://www.gnu.org/software/xorriso/"
license=("GPLv3")
source=("http://www.gnu.org/software/xorriso/${pkgname}-${pkgver}.tar.gz"
        "http://www.gnu.org/software/xorriso/${pkgname}-${pkgver}.tar.gz.sig"
        "http://www.gnu.org/software/xorriso/README_xorriso")
sha1sums=('28ed07f6a3ec831e476630257e8fedf714259ca1'
          '8e05ec493509f337bb3c1059651ba824c5d22927'
          '4da3276b8971b3bfd7f199290a110a81ea5460f0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-external-filters \
    --enable-external-filters-setuid \
    --enable-launch-frontend \
    --enable-launch-frontend-setuid
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  ## We do not include the GUI here. Rather, there will be an extra package for that.
  rm -v "${pkgdir}"/usr/bin/xorriso-tcltk

  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -v "${srcdir}/README_xorriso" "${pkgdir}/usr/share/doc/${pkgname}/"
}

