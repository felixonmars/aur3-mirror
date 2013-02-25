# Contributor:  mathieui <mathieui@mathieui.net>
pkgname=pgu
pkgver=0.18
pkgrel=1
pkgdesc="Phil's pyGame Utilities A collection of handy utilities and libraries created by Phil Hassey."
arch=('any')
url="http://code.google.com/p/pgu/"
license=('LGPL')
depends=('python2-pygame' 'python2')
source=("http://pgu.googlecode.com/files/$pkgname-$pkgver.zip")
md5sums=('e318722f1bb92a407f29c0d0ad893607')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}" || return 1
}
