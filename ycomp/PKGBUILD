# Maintainer: Klaas Boesche <aurkagebe@gmail.com>
pkgname=ycomp
_pkgname=yComp
pkgver=1.3.19
pkgrel=1
pkgdesc="Visualization System for Program Dependency Graphs in VCG format."
arch=(any)
url="http://www.info.uni-karlsruhe.de/software/ycomp/"
license=('custom')
depends=(java-runtime)
source=("http://pp.ipd.kit.edu/firm/download/${_pkgname}-${pkgver}.zip"
        "LICENSE"
        "yComp"
        "yComp.desktop"
        "yComp.png")

package() {
  install -d "${pkgdir}/usr/share/java/${_pkgname}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for file in *.jar
  do
    install -m644 "${srcdir}/${_pkgname}-${pkgver}/${file}" "${pkgdir}/usr/share/java/${_pkgname}/${file}"
  done
  install -D -m 755 "${srcdir}/yComp" "${pkgdir}/usr/bin/yComp"
  install -D -m 644 "${srcdir}/yComp.desktop" "${pkgdir}/usr/share/applications/yComp.desktop"
  install -D -m 644 "${srcdir}/yComp.png" "${pkgdir}/usr/share/pixmaps/yComp.png"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}


# vim:set ts=2 sw=2 et:
md5sums=('68a698c087108947d92cbaaaf1deebfb'
         '29c356a815baf6246667a419cda09abb'
         '8d843b5fd0ab838550ebe61ee7242d1d'
         '866c3e7d96bc1b086ed491879f199a2a'
         '4013917bb1ec8a4cab0823b40d27d3be')
