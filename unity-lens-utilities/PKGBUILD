# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-lens-utilities
pkgver=0.1
pkgrel=1
pkgdesc="Unity Utilities Lens"
arch=('any')
url="https://launchpad.net/onehundredscopes"
license=('GPL')
depends=('dee' 'libunity')
makedepends=('python2-distutils-extra')
options=('!emptydirs')
source=("http://ppa.launchpad.net/scopes-packagers/ppa/ubuntu/pool/main/u/unity-lens-utilities/unity-lens-utilities_${pkgver}-0~10~quantal1.tar.gz")
sha512sums=('e1e15320e4d7ccab45f07c222e62c7e66f27c52ae82ffb2581de343d4e0dc40c8ed9ee39ce44cd9025335c19e9c63de53f5251ddb5a9302de8b944110330586c')

package() {
  cd "${srcdir}/recipe-{debupstream}-0~{revno}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
