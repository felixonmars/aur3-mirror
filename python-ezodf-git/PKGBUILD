# Maintainer: Simon Klemenc <simon@booya.at>
project_name=ezodf
pkgname=python-ezodf-git
pkgver=0.2.5.r25.ga7edafa
pkgrel=1
pkgdesc="A Python lib for OpenDocument (dual python2/python3)"
arch=('any')
url="https://github.com/T0ha/ezodf"
license=('MIT')
depends=('python2-lxml' 'python-lxml')
makedepends=('git')
conflicts=('python2-ezodf' 'python-ezodf')
provides=('python2-ezodf' 'python-ezodf')
source=("$pkgname"::'git://github.com/T0ha/ezodf')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/"
  python setup.py install --root="$pkgdir/"
}
