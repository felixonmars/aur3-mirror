# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

_name=zope.component
pkgname=python-zope-component
pkgver=4.1.0
pkgrel=1
pkgdesc="Zope Component Architecture"
arch=('any')
url="http://cheeseshop.python.org/pypi/zope.component/"
license=('ZPL')
depends=('python-zope-interface' 'python-zope-event')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/z/$_name/$_name-$pkgver.zip")
md5sums=('8e185893699f9fa577bd9ada0a5302fa')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/"
}
