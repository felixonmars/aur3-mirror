# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-quick2wire-git
_gitname='quick2wire-python-api'
pkgver=0.0.0.2.12.gc5e21e9
pkgrel=2
pkgdesc="Python API for controlling GPIO and I2C devices connected to the Raspberry Pi"
arch=(any)
url="https://github.com/quick2wire/quick2wire-python-api"
license=('MIT' 'LGPL')
depends=('python')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/quick2wire/quick2wire-python-api.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build  
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "MIT_LICENSE.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
