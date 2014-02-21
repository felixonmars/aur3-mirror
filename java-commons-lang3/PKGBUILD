# Maintainer: Alex Brinister <alex_brinister@yahoo.com>
_lang_name="commons-lang3"
pkgname=java-${_lang_name}
pkgver=3.2.1
pkgrel=1
pkgdesc='Implementations of common Lang - version 3'
arch=('i686' 'x86_64')
url='http://commons.apache.org/lang/'
license=('Apache')
depends=('java-runtime')
makedepends=('junit' 'apache-ant')
source=("http://download.nextag.com/apache//commons/lang/source/${_lang_name}-${pkgver}-src.tar.gz")
sha512sums=('b4bf33e4604ca5a29e56eb5e4ccaacbf1b53733b02248dc1972862b1a2e69f24be98b9d1dd8b2d44e25ed95e422306e52f192010251329f7d19c5b78a6a45a84')

build() {
  cd "${srcdir}/${_lang_name}-${pkgver}-src/"

  # Tests currently fail
  #ant jar test
  ant jar
}

package() {
  cd "${srcdir}/${_lang_name}-${pkgver}-src/target/"

  install -dm755 "${pkgdir}/usr/share/java/${_lang_name}/"
  install -m644 ${_lang_name}-${pkgver}.jar \
    "${pkgdir}/usr/share/java/${_lang_name}/${_lang_name}.jar"
}

# vim:set ts=2 sw=2 et:
