# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

_name=zope.component
pkgname=python2-zope-component
pkgver=4.1.0
pkgrel=1
pkgdesc="Zope Component Architecture"
arch=('any')
url="http://cheeseshop.python.org/pypi/zope.component/"
license=('ZPL')
depends=('python2-zope-interface' 'python2-zope-event')
makedepends=('python2-distribute')
provides=('zope-component')
conflicts=('zope-component')
replaces=('zope-component')
source=("http://pypi.python.org/packages/source/z/$_name/$_name-$pkgver.zip")
md5sums=('8e185893699f9fa577bd9ada0a5302fa')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}
