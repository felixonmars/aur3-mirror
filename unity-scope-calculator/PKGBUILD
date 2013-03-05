# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-scope-calculator
pkgver=0.1
pkgrel=1
pkgdesc="Unity Calculator Scope"
arch=('any')
url="https://launchpad.net/onehundredscopes"
license=('GPL')
depends=('dee' 'gcalctool' 'libunity' 'unity-lens-utilities')
makedepends=('python2-distutils-extra')
options=('!emptydirs')
source=("http://ppa.launchpad.net/scopes-packagers/ppa/ubuntu/pool/main/u/unity-scope-calculator/unity-scope-calculator_${pkgver}-0~12~quantal1.tar.gz")
sha512sums=('e729952aed1f3ce122ccd57525672cff4c17ce274951294510e0dfb77467773e1965305e486f3c92ccce37a301afab2cb9578d70b06a9e37124dfe084d35c3c1')

package() {
  cd "${srcdir}/recipe-{debupstream}-0~{revno}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
