# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=runbench-bzr
pkgver=28
pkgrel=1
pkgdesc="Run GLMark2 against the Mir server"
arch=('any')
url="http://ppa.launchpad.net/mir-team/staging/ubuntu/pool/main/r/runbench/"
license=('GPL')
groups=('unitynext')
depends=('glmark2-mir-bzr' 'python')
makedepends=('bzr')
source=("runbench::bzr+http://bazaar.launchpad.net/~thomir/%2Bjunk/runbench/")
sha512sums=('SKIP')

pkgver() {
  cd runbench
  bzr revno
}

package() {
  cd "${srcdir}/runbench"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
