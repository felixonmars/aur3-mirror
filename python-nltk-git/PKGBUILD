# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chris Baker <baker.chris.3@gmail.com>

_pkgname=nltk
pkgname=python-nltk-git
pkgver=3.0a1.558.g47d0006
pkgrel=1
pkgdesc='Software for natural language processing'
arch=('any')
url='http://www.nltk.org/'
license=('APACHE')
depends=('python-yaml')
optdepends=('nltk-data: test data'
            'python-numpy: used for calculations'
            'python-matplotlib: used for plotting')
makedepends=('git' 'python-distribute')
provides=('python-nltk')
conflicts=('python-nltk')
source=('git://github.com/nltk/nltk.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
}
