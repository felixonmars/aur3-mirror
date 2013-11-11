# Maintainer: Hector Mtz-Seara <hseara__*a*t*__gmail*.*com>

pkgname=python2-mmtk
pkgver=2.7.9
pkgrel=1
pkgdesc="The Molecular Modelling Toolkit (MMTK) is an Open Source program library for molecular simulation applications."
arch=('i686' 'x86_64')
url="http://dirac.cnrs-orleans.fr/MMTK"
license=('custom:CeCILL')
depends=('python2-scientificpython')
source=(https://sourcesup.renater.fr/frs/download.php/4324/MMTK-2.7.9.tar.gz)
sha1sums=('5f1859342c8ac159efa65d136520c460f1491359')

build() {
  cd "$srcdir"/MMTK-$pkgver
  python2 setup.py build
}

package() {
    cd "$srcdir"/MMTK-$pkgver
    python2 setup.py install --prefix=/usr --root=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

