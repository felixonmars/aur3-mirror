# Maintainer: Sébastien Chauvel (sinma) <perso@hack-libre.org>
# Based on hunspell-fr-cpr90 PKGBUILD

pkgname=hunspell-fr-revised-base
pkgver=5.3
pkgrel=1
pkgdesc="French (1990 reform) hunspell dictionary. No symlink (fr_BE, fr_CA, etc)"
arch=(any)
url="http://www.dicollecte.org/"
license=('custom:MPLv2')
optdepends=('hunspell:  the spell checking libraries and apps')
provides=('hunspell-fr')
conflicts=('hunspell-fr hunspell-fr-cpr90')
source=(http://www.dicollecte.org/download/fr/hunspell-french-dictionaries-v${pkgver}.zip
        LICENSE)
sha256sums=('604664c075140b889040a41575e211569eb4eece2ec0cf670ceb9f2a09024731'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-reforme1990.dic ${pkgdir}/usr/share/hunspell/fr.dic
  install -m644 fr-reforme1990.aff ${pkgdir}/usr/share/hunspell/fr.aff

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
