# Maintainer: Adrián Chaves Fernández (Gallaecio) <adriyetichaves@gmail.com>, 2009-2010.
# Contributor: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=hunspell-gl
pkgver=13.10
pkgrel=2
pkgdesc='Galician spellchecker for Hunspell'
arch=('any')
url='https://github.com/meixome/hunspell-gl'
license=('GPL3')
depends=('hunspell')
makedepends=('scons' 'python2-pyicu')
source=('https://github.com/meixome/hunspell-gl/archive/13.10.tar.gz')
md5sums=('27bc69f0beb92a46a00420e6e7c2a7ed')

lang="gl"
lang2="gl_ES"

build() {
  # Compile...
  cd "${srcdir}/${pkgname}-${pkgver}"
  scons
}

package() {
  # Creation of necesary folders...
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"

  # Actual installation...
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/build/${lang}.aff" "${pkgdir}/usr/share/hunspell/${lang2}.aff"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/build/${lang}.dic" "${pkgdir}/usr/share/hunspell/${lang2}.dic"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in "${pkgdir}"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
}
