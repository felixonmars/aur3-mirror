# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

_name=zope.event
pkgname=python2-zope-event
pkgver=4.0.2
pkgrel=1
pkgdesc="Zope Event Publication"
arch=('any')
url="http://cheeseshop.python.org/pypi/zope.event/"
license=('ZPL')
depends=('python2')
makedepends=('python2-distribute')
provides=('zope-event')
conflicts=('zope-event')
replaces=('zope-event')
source=("http://pypi.python.org/packages/source/z/$_name/$_name-$pkgver.tar.gz")
md5sums=('e08dd299d428d77a1cfcbfe841b81872')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}
