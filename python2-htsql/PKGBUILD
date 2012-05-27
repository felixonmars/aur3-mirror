# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Gour <gour@atmarama.net>

pkgname=python2-htsql
_pkgname=HTSQL
pkgver=2.3.0
pkgrel=1
pkgdesc="URI-based high-level query language for relational databases"
url="http://htsql.org/"
arch=('i686' 'x86_64')
license=('custom')
depends=('python2-distribute' 'python-yaml>=3.0.7')
source=(http://pypi.python.org/packages/source/H/${_pkgname}/${_pkgname}-$pkgver.tar.gz)
md5sums=('77afb3dcfe5b37561223145e22f92fea')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
