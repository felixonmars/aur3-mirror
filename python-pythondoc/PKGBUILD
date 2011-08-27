# Contributor: Yerko Escalona < yescalona at ug dot uchile dot cl >

pkgname=python-pythondoc
_pkgname=pythondoc
pkgver=2.0
orirel=20031103
pkgrel=2
pkgdesc="A JavaDoc-like documentation tool for Python"
arch=(any)
url="http://effbot.org/"
license=(custom)
depends=('python' 'python-elementtree')
options=(!emptydirs)
source=(${url}media/downloads/${_pkgname}-${pkgver}-${orirel}.tar.gz)
md5sums=('aea4bcb270e3b89dc77bbb49580461b9')


build() {
  cd $srcdir/${_pkgname}-${pkgver}-${orirel}
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
  install -D -m644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

