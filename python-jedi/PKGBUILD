# Submitter: Jesus Alvarez
# Maintainer: Danilo Bargen <gezuru@gmail.com>
pkgname=python-jedi
pkgver=0.7.0
pkgrel=1
pkgdesc="Awesome autocompletion for python. Official PKGBUILD."
arch=('any')
url="https://github.com/davidhalter/jedi"
license=('LGPL3')
depends=('python')
makedepends=('python-distribute')
conflicts=('jedi-git' 'python3-jedi-git')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/j/jedi/jedi-${pkgver}.tar.gz")
sha256sums=('01f0d070ff3852bb6325f436c87070714ccf3d6edb057d9b562a1b19a601daa9')

package() {
  cd "$srcdir/jedi-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
