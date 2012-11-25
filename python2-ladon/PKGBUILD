pkgname=python2-ladon
pkgver=0.7.2
pkgrel=1
pkgdesc='A framework for exposing methods to several internet service protocols'
arch=('any')
url="http://ladonize.org/"
license=('GPL')
depends=('python2>=2.7')
optdepends=('python2-jinja: required to render the browsable API')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/l/ladon/ladon-0.7.2.tar.gz#md5=d4cd91ad81b2df59bcc152081a7d635c)

build() {
  cd ladon-$pkgver

  python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

md5sums=('d4cd91ad81b2df59bcc152081a7d635c')
