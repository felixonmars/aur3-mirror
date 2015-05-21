# Maintainer: icasdri <icasdri at gmail dot com>
_pkgname=jsbeautifier
pkgname=python-jsbeautifier
pkgver=1.5.5
pkgrel=1
pkgdesc="Beautify, unpack or deobfuscate JavaScript. Handles popular online obfuscators."
url="https://github.com/beautify-web/js-beautify"
arch=('any')
license=('MIT')
depends=('python' 'python-six>=1.6.1')
provides=('python-jsbeautify')
source=("https://pypi.python.org/packages/source/j/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80c830aee40c6fdce762dc15dd09cd4c078018da07183e190c08d51f31bfeaaa')

package() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}"
}
