# Maintainer: mSSM
# Contributor: polyzen <polycitizen@gmail.com>

pkgname=python2-simhash-git
pkgver=r38.ba372af
pkgrel=1
pkgdesc='A Python Implementation of Simhash Algorithm'
url='https://github.com/liangsun/simhash'
license='MIT'
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
conflicts=('python2-simhash')
provides=('python2-simhash')
source=('git://github.com/liangsun/simhash.git')
md5sums=('SKIP')


pkgver() {
    cd simhash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd simhash
  python2 setup.py build
}

package() {
  cd simhash
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
