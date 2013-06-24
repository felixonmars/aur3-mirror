# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-django-cumulus-git
pkgver=1.0.10.52.gcddc573
pkgver() {
  cd $srcdir/$pkgname
  git describe --tags --long | sed 's/-/./g'
}

pkgrel=1
pkgdesc="A set of tools to utilize the python-swiftclient api through Django"
arch=('i686' 'x86_64')
url="https://github.com/richleland/django-cumulus"
license=('custom')
depends=('python2-pyrax')
makedepends=('git')
provides=('python2-django-cumulus')
source=("$pkgname::git://github.com/richleland/django-cumulus.git")
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
