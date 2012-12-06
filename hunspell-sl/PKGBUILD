# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=hunspell-sl
pkgver=20070127
pkgrel=2
pkgdesc="Slovenian hunspell dictionaries"
arch=(any)
url="ftp://ftp.snt.utwente.nl/pub/software/openoffice/contrib/dictionaries/"
license=('LGPL2')
optdepends=('hunspell:  the spell checking libraries and apps')
source=(ftp://ftp.snt.utwente.nl/pub/software/openoffice/contrib/dictionaries/sl_SI.zip)
sha256sums=('b5f4b671c2d002b69e6cf766a429237cfe872ef64ca315ca0863422e7e0f2393')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 sl_SI.dic "${pkgdir}/usr/share/hunspell/sl_SI.dic"
  install -m644 sl_SI.aff "${pkgdir}/usr/share/hunspell/sl_SI.aff"

  # the symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_sl_SI.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
