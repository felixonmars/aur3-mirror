# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=python2-springpython
pkgver=1.2.1
pkgrel=1
pkgdesc="Spring Python intends to take the concepts that were developed, tested, and proven with the Spring Framework, and carry them over to the language of Python."
arch=(any)
license=(GPL)
source="http://s3.amazonaws.com/dist.springframework.org/release/EXTPY/springpython-${pkgver}.FINAL.tar.gz"
url="http://www.springsource.org/"
depends=('python2')
md5sums=('99f049e20d6a6ebdd3bfbb7bd5aecc9b')
provides=('springpython')

build() {
  cd "$srcdir/springpython-${pkgver}.FINAL"
  
  # install module in vendor directories.
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
