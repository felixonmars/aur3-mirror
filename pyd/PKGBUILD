# Contributor: Cyril Dolgoff <wahnby@yahoo.fr>

pkgname=pyd
pkgver=RC1
pkgrel=1
pkgdesc="Library for the D language that wraps the Python/C API with a cleaner, simpler interface."
arch=(i686 x86_64)
depends=('python>=2.4')
makedepends=('gdc')
source=(http://svn.dsource.org/projects/pyd/downloads/celerid-RC1.tar.bz2)
url="http://pyd.dsource.org/"
md5sums=('1f058274a11284a7242688eef8c086a3')

build() {
  cd ${startdir}/src/celerid-${pkgver}
#  sed -i 's/not in packageCodeFiles/not in packageCodeFiles and f.endswith(".d")/' setup.py
  python setup.py install --root=${startdir}/pkg
}
