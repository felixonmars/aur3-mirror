# Submitter: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Danilo Bargen <gezuru@gmail.com>
pkgname=python2-jedi
pkgver=0.7.0
pkgrel=2
pkgdesc="Awesome autocompletion for python. Official PKGBUILD."
arch=('any')
url="https://github.com/davidhalter/jedi"
license=('LGPL3')
depends=('python2')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/j/jedi/jedi-${pkgver}.tar.gz")
sha256sums=('01f0d070ff3852bb6325f436c87070714ccf3d6edb057d9b562a1b19a601daa9')

package() {
  cd "$srcdir/jedi-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
