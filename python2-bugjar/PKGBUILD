# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-bugjar
_pkgname=bugjar
pkgver=0.1.0
pkgrel=2
pkgdesc="A interactive graphical debugger for Python code"
arch=(any)
url="https://github.com/pybee/bugjar"
license=('BSD')
depends=('python2' 'python2-tkreadonly' 'python2-pygments')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('bf34474b816e2808b04e9dfd835eda25')

build()
{
  # Install using setup.py
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
