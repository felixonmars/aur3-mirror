# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=python-pexpect-u
pkgver=2.5.1
pkgrel=1
pkgdesc='A pure Python Expect-like module'
arch=('any')
url='http://pypi.python.org/pypi/pexpect-u'
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/pexpect-u/pexpect-u-2.5.1.tar.gz")
md5sums=('7c916a9f42d636ec6aec39f7cdd96eb5')

build() {
  cd $srcdir/pexpect-u-$pkgver

  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
