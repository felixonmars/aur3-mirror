# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chris Baker <baker.chris.3@gmail.com>

_pkgname=nltk
pkgname=python2-nltk-git
pkgver=3.0a1.558.g47d0006
pkgrel=1
pkgdesc='Software for natural language processing'
arch=('any')
url='http://www.nltk.org/'
license=('APACHE')
depends=('python2-yaml')
optdepends=('nltk-data: test data'
            'python2-numpy: used for calculations'
            'python2-matplotlib: used for plotting')
makedepends=('git' 'python2-distribute')
provides=('python2-nltk')
conflicts=('python2-nltk')
source=('git://github.com/nltk/nltk.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd $_pkgname
  python2 setup.py build
}

package() {
  cd $_pkgname
  python2 setup.py install --root=${pkgdir} --optimize=1
}
