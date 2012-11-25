pkgname=python-ladon
pkgver=0.7.2
pkgrel=1
pkgdesc='A framework for exposing methods to several internet service protocols'
arch=('any')
url="http://ladonize.org/"
license=('GPL')
depends=('python>=3.1')
optdepends=('python-jinja: required to render the browsable API')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/l/ladon/ladon-0.7.2.tar.gz#md5=d4cd91ad81b2df59bcc152081a7d635c)

build() {
  cd ladon-$pkgver

  cp scripts/{ladon3.2ctl,ladon3.3ctl}
  cp scripts/{ladon3.2ctl.py,ladon3.3ctl.py}

  python ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

md5sums=('d4cd91ad81b2df59bcc152081a7d635c')
