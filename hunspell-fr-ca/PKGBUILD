# Contributer: Guillaume ALAUX <guillaume@archlinux.org>
# Maintainer: bwrsandman <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/hunspell-fr-CA

pkgname=hunspell-fr-ca
pkgver=5.3
pkgrel=1
pkgdesc='Canadian French (modern) hunspell dictionaries'
arch=(any)
url='http://www.dicollecte.org/home.php?prj=fr'
license=('custom:MPLv2')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-fr')
source=(http://www.dicollecte.org/download/fr/${pkgname/-fr-ca/}-french-dictionaries-v${pkgver}.zip
        LICENSE)
sha256sums=('604664c075140b889040a41575e211569eb4eece2ec0cf670ceb9f2a09024731'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-moderne.dic ${pkgdir}/usr/share/hunspell/fr_CA.dic
  install -m644 fr-moderne.aff ${pkgdir}/usr/share/hunspell/fr_CA.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/fr_CA.dic ${pkgdir}/usr/share/myspell/dicts/
  ln -s /usr/share/hunspell/fr_CA.aff ${pkgdir}/usr/share/myspell/dicts/
  
  # docs
  install -Dm644 README_dict_fr.txt ${pkgdir}/usr/share/doc/${pkgname}/README_dict_fr.txt

  # license
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
