# Maintainer: Renan Birck <renan.ee.ufsm at Google's mail service>

pkgname=pyevolve
pkgver=0.6rc1
pkgrel=1
pkgdesc="A Python framework for genetic algorithms."
arch=('any')
url="http://pyevolve.sourceforge.net/"
license=('custom open-source')
depends=('python2' 'python2-pysqlite')
source=("http://ufpr.dl.sourceforge.net/project/pyevolve/Pyevolve/0.6rc1/Pyevolve-${pkgver}.tar.gz")
md5sums=('b9c8caa823c5312cce3abda897f8f5fe')
optdepends=('matplotlib: Plotting support for pyevolve_graph.py')

package() {
  # Sometimes it is named 'Pyevolve', sometimes 'pyevolve'.
  cd "${srcdir}/${pkgname/p/P}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
