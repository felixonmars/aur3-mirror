pkgname=hunspell-ko
pkgver=0.5.6
pkgrel=1
pkgdesc="Korean hunspell dictionary"
arch=('any')
url="https://github.com/changwoo/hunspell-dict-ko"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=(https://github.com/changwoo/hunspell-dict-ko/releases/download/${pkgver}/ko-aff-dic-${pkgver}.zip)
md5sums=('cd129f5f27e0b13752f2d8bd2440806b')

package() {
  cd "${srcdir}/ko-aff-dic-${pkgver}"
  
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 ko.dic ko.aff ${pkgdir}/usr/share/hunspell

  pushd ${pkgdir}/usr/share/hunspell
  ln -s ko.aff ko_KR.aff
  ln -s ko.dic ko_KR.dic
  popd

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd
}
