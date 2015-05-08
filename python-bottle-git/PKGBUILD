pkgname=python-bottle-git
pkgver=0.11.1.r413.g78e1f5f
pkgrel=1
pkgdesc='fast and simple micro-framework for python web-applications'
arch=('any')
url='http://bottlepy.org/'
license=('custom:BSD')
depends=('python')
makedepends=('git')
conflicts=('python-bottle')
provides=('python-bottle')
source=("$pkgname::git+https://github.com/bottlepy/bottle.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  python setup.py build
}

package() {
  cd $pkgname

  python setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python-bottle
}
