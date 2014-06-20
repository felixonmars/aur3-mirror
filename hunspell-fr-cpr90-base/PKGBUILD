# Maintainer: Sébastien Chauvel (sinma) <eichi237@mailoo.org>
# Based on hunspell-fr-cpr90 PKGBUILD

pkgname=hunspell-fr-cpr90-base
pkgver=5.1
pkgrel=1
pkgdesc="French (1990 Reform) hunspell dictionaries — no symlink for fr_BE, fr_CA, etc"
arch=(any)
url="http://www.dicollecte.org/"
license=('custom:MPLv2')
optdepends=('hunspell:  the spell checking libraries and apps')
provides=('hunspell-fr')
conflicts=('hunspell-fr hunspell-fr-cpr90')
source=(http://www.dicollecte.org/download/fr/hunspell-french-dictionaries-v${pkgver}.zip
        LICENSE)
md5sums=('f0f52e732d9843aff0d203968b1146b0'
         '815ca599c9df247a0c7f619bab123dad')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-toutesvariantes.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-toutesvariantes.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

  pushd ${pkgdir}/usr/share/hunspell/

  popd

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs and license
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README_dict_fr.txt ${pkgdir}/usr/share/doc/${pkgname}/README_dict_fr.txt
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}