# Maintainer: Ander Martinez (basaundi) <anderDOTbasaundi@gmailDOTcom>
# Based on hunspell-* PKGBUILDs

pkgname=hunspell-eu
pkgver=20150105
pkgrel=1
pkgdesc="Basque hunspell dictionary"
arch=(any)
url="http://github.com/basaundi"
license=('GPL2')
optdepends=('hunspell:  the spell checking libraries and apps')
source=("http://www.euskara.euskadi.net/r59-20660/eu/contenidos/informacion/euskarazko_softwarea/eu_9567/adjuntos/eu-ES-hunspell.tar.gz")
md5sums=('57ff126e635fb8ac3fe6e54ff79a0ef5')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 eu-ES/eu-ES.dic ${pkgdir}/usr/share/hunspell/eu.dic
  install -m644 eu-ES/eu-ES.aff ${pkgdir}/usr/share/hunspell/eu.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd
}
