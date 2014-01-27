# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Xiao Er <xia0er@gmail.com>
# Contributor: Victor Noel <victor.noel@crazydwarves.org>

pkgname='python-prettytable'
pkgver=0.7.2
pkgrel=4
pkgdesc="A simple Python library for easily displaying tabular data in a visually appealing ASCII table format"
url="https://code.google.com/p/prettytable/"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/P/PrettyTable/prettytable-${pkgver}.tar.gz")
sha512sums=('84611b9ad11bd428cdb00795e0a9baff44d027331b73ed1742596acda8acc8aca3df4276fa2f2ca2289f10b2989b3c86556de70bca6a9773b15cd80c54c33117')

package() {
  cd $srcdir/prettytable-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
