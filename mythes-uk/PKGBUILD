# Maintainer: Rax Garfield <admin at dvizho.ks.ua>

pkgname=mythes-uk
pkgver=1.6.5
pkgrel=1
pkgdesc="Ukrainian thesaurus"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus"
license=('LGPL3' 'GPL3')
groups=('dict-uk')
optdepends=(
	'libmythes: offers thesaurus library functions'
	'hunspell-uk: Ukrainian spelling dictionary'
	'hyphen-uk: Ukrainian hyphenation rules'
)
source=(http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus/releases/1.6.5/dict-uk_ua-1.6.5.oxt)
md5sums=('30746735548944edf5f4c9ef6881c510')

package() {
  cd ${srcdir}/uk_UA
  install -dm755 ${pkgdir}/usr/share/mythes
  install -m 644 th_uk_UA.* ${pkgdir}/usr/share/mythes

  # symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename ${file}) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 README_th_uk_UA.txt ${pkgdir}/usr/share/doc/${pkgname}
}
