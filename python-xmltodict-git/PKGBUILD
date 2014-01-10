# Maintainer: Aleksander Nitecki <ixendr@itogi.re>

# This PKGBUILD provides only system default Python's version - which currently is 3.
# I don't need python2 version of this package, so I omitted it.
# Also, it's basically copied from python-requests-git package.

pkgname=python-xmltodict-git
_gitname=xmltodict
pkgver=v0.8.3
pkgrel=1
pkgdesc="Python module that makes working with XML feel like you are working with JSON"
url="https://github.com/martinblech/xmltodict"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
provides=('python-xmltodict')
conflicts=('python-xmltodict')
source=('git://github.com/martinblech/xmltodict.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}"
}
