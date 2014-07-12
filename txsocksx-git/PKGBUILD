pkgname=txsocksx-git
pkgver=1.13.0.1.3.g1fb0462
pkgrel=1
pkgdesc="SOCKS{4,4a,5} endpoints for twisted"
arch=('any')
url="https://github.com/habnabit/txsocksx"
license=('MIT')
depends=('python2' 'twisted' 'python2-pyopenssl' 'parsley-git')
makedepends=('git' 'python2-setuptools')
source=("$pkgname"::git://github.com/habnabit/txsocksx.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver=$(git describe --always)
  printf "%s\n" "${ver//-/.}"
}

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
