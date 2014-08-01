# Maintainer: Davide Depau <me@davideddu.org>

_pkgname=plyer
pkgname=python2-$_pkgname-git
pkgver=20140731
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs - Git version"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
provides=('python2-plyer')
conflicts=('python2-plyer')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(git://github.com/kivy/$_pkgname.git)
md5sums=('SKIP')

prepare(){
  cd $_pkgname

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $_pkgname

  msg 'Installing...'
  python2 setup.py build
}

package() {
  cd $_pkgname

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
