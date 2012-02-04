# Maintainer: Sergio A. Morales <sergiomorales@archlinux.cl>
# Contributor: Daniel Apolinario <dapolinario@gmail.com>
pkgname=pinax
pkgver=0.9a2
pkgrel=1
pkgdesc="Pinax is an open-source platform built on the Django Web Framework."
arch=('i686' 'x86_64')
url="http://pinaxproject.com/"
license=('MIT')
depends=('python2' 'python-imaging' 'python2-pip')
source=("http://pypi.python.org/packages/source/P/Pinax/Pinax-0.9a2.tar.gz")
md5sums=('26bc27047eafad923be0f107022be839')
makedepends=("perl" "python2-virtualenv")
install=('pinax.install')
build() {
  cd ${startdir}/src/Pinax-${pkgver}
  python2  setup.py install --root="$pkgdir/" --optimize=1
}