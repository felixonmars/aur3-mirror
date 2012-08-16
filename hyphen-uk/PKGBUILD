# Maintainer: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hyphen-uk
pkgver=1.6.5
pkgrel=1
pkgdesc="Ukrainian hyphenation rules"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus"
license=('LGPL3' 'GPL3')
groups=('dict-uk')
optdepends=(
	'hyphen: offers hyphenation library functions'
	'hunspell-uk: Ukrainian spelling dictionary'
	'mythes-uk: Ukrainian thesaurus'
)
source=(http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus/releases/1.6.5/dict-uk_ua-1.6.5.oxt)
md5sums=('30746735548944edf5f4c9ef6881c510')

package() {
  cd ${srcdir}/uk_UA
  install -dm755 ${pkgdir}/usr/share/hyphen
  install -m 644 hyph_uk_UA.dic ${pkgdir}/usr/share/hyphen

  # symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename ${file}) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 README_hyph_uk_UA.txt ${pkgdir}/usr/share/doc/${pkgname}
}
