# Contributor: Michal Bozon <michal.bozon__at__gmail.com>
pkgname=python-yaml-py
_pkgname=PyYAML
pkgver=3.06
pkgrel=1
pkgdesc="Pure python YAML library"
arch=('i686' 'x86_64')
url="http://pyyaml.org"
license=('MIT')
depends=('python>=2.3')
provides=('python-yaml')
conflicts=('python-yaml-libyaml' 'python-yaml')
source=(http://pyyaml.org/download/pyyaml/PyYAML-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py --without-libyaml install \
    --prefix=/usr --root=$pkgdir || return 1
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('3d3c92528f1547756c9e1d80d7d905c7')
