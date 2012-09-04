# Contributor: wido <widowild [at] myopera [dot] com>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-keymap
pkgver=1
pkgrel=7
_languages=de,en_GB,es_AR,es_ES,fr,fr-dvorak-bepo,hu,it,pt_BR,pt_PT,ro,sk_QWERTY,sk_QWERTZ,sl,sv,tr
pkgdesc="Keymaps packs for logkeys"
arch=('any')
license=('GPL3')
url="http://code.google.com/p/logkeys/"
eval source=(http://logkeys.googlecode.com/svn/wiki/keymaps/{${_languages}}.map)

package() {
  cd ${srcdir}/
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
      install -D -m 644 ${lang}.map ${pkgdir}/usr/share/lkmaps/${lang}.map || return 1
  done
}

md5sums=('4cbf75f4b432aa4d7b0744c98c02e930'
         '362399f301c792c22e3403819d8399d1'
         'b5f79cf80488bcffa741e75d67af929b'
         '5414ca32a0e4d9ecd348ed05493d3a8b'
         '2a8963c12b0745bd1e58df7c7d7a65bb'
         '2c213183d2a1df5b8c8c71197961db9c'
         '6e805394c4eebd7259c24803bf4a8755'
         'f189f5ca8665fa672b5c96220a2e9d19'
         'f5678a5a7f5fa7da95cce6d79efbe384'
         'f8ec738255f7bcbbca0ecc779230b41a'
         'bdac4a8f0f891089c2d04f16f7112e91'
         'ab7049328f4af2c9c5a0f5d27b365206'
         '91795c11ff65fbe7295c9c8063fb2821'
         'ab676c64fd201c81e42058cc946d237e'
         'be30bab5ea27459ded289d6b7ea9aa87'
         '98bf3b37ad9b92b35e65b20b9d3fee0e')
