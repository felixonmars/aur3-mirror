
pkgname=otf-bakoma
pkgver=1
pkgrel=1
pkgdesc="Computer Modern fonts in Open Type format"
url="http://www.ctan.org/tex-archive/fonts/cm/ps-type1/bakoma/"
arch=any
depends=(fontconfig xorg-font-utils)
makedepends=unzip
install=otf-bakoma.install
license=BakoMa-license
source=(http://mirror.ctan.org/fonts/cm/ps-type1/bakoma.zip)
md5sums=(d152dd4fae1bfb692243be51925a4157)

build() {
  mkdir -p "${pkgdir}"/usr/share/fonts/OTF
  chmod -x "${srcdir}"/bakoma/otf/*.otf
  cp "${srcdir}"/bakoma/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF

  # copy LICENSE into correct directory
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  chmod -x "${srcdir}"/bakoma/LICENCE
  cp "${srcdir}"/bakoma/LICENCE ${pkgdir}/usr/share/licenses/${pkgname}
}

