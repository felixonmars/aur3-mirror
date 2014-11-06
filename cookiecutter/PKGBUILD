# Maintainer: Mike Cooper <mythmon@gmail.com>

pkgname=cookiecutter
pkgver=0.8.0
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=('any')
url="https://github.com/audreyr/cookiecutter"
license=('BSD')
groups=('devel')
depends=('python2' 'python2-jinja' 'python2-yaml' 'python2-binaryornot')
makedepends=()
provides=()
conflicts=(python-cookiecutter)
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d45376376343705088503a1939fdb7f7')

package() {
      cd "$srcdir/${pkgname}-${pkgver}"
      python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
