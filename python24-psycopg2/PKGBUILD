# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

_pkgname=psycopg2
pkgname=python24-$_pkgname
pkgver=2.4.5
pkgrel=1
pkgdesc="A PostgreSQL database adapter for the Python programming language"
arch=('i686' 'x86_64')
url='http://initd.org/psycopg/'
license=('PSF')
depends=('python24' 'postgresql-libs>=8.4.1')
makedepends=('python24-setuptools')
source=(http://www.psycopg.org/psycopg/tarballs/PSYCOPG-2-4/$_pkgname-$pkgver.tar.gz)
sha256sums=('48b702a7ca479e1bc2c1a7b81875a07d474298132605993e2cb979f5e08277d7')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2.4 setup.py install --root="$pkgdir/" --optimize=1
}
