# Maintainer: floyd2 <florian@kellmer.net>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase=pure-python-otr
pkgname=$pkgbase-git
pkgver=119.1.0.0.6.g493225e
pkgrel=1
pkgdesc="A pure python implementation of the OTR encryption protocol."
arch=('any')
url="https://github.com/afflux/$pkgbase"
depends=('python' 'python-crypto>=2.1')
makedepends=('git')
license=('LGPL3')
md5sums=('SKIP')

source=("git+git://github.com/afflux/${pkgbase}.git")

pkgver() {
  cd "$pkgbase"
  echo "$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g' )"
}

package() {
  cd "$pkgbase"
  python setup.py install --root="$pkgdir/" --optimize=1
}
