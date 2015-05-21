# Maintainer: Jonathan Ryan <jryan@curious-computing.com>
pkgname=thefuck-git
_pkgname="${pkgname%-git}"
pkgver=1.42.r354.2c3df1a
pkgrel=2
pkgdesc="Magnificent app which corrects your previous console command."
arch=(any)
url="https://github.com/nvbn/thefuck"
license=('MIT')
depends=('python' 'python-pathlib' 'python-colorama' 'python-psutil' 'python-wheel' 'python-six')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-mock' 'python-pytest-mock')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=thefuck-git.install
source=('git+http://github.com/nvbn/thefuck.git' 'thefuck-git.install')
md5sums=('SKIP'
         'ce3955458e1d6993125c2458564c94db')

pkgver() {
  cd "$srcdir/${_pkgname}"
  _version="$(python setup.py -V)"
  printf "${_version}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

check() {
  cd "$srcdir/${_pkgname}"
  py.test
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
