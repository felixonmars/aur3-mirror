# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=onboard
pkgver=0.97.0
pkgrel=1
pkgdesc="An on-screen keyboard useful on tablet PCs or for mobility impaired users."
arch=('i686' 'x86_64')
url="https://launchpad.net/onboard"
license=('GPL')
depends=('libxtst' 'python2-cairo' 'dbus-python' 'python2-gobject' 'libwnck3' 'python-virtkey' 'desktop-file-utils' 'dconf' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('python-distutils-extra')
optdepends=('at-spi2-atk: auto-hide'
            'mousetweaks: control mouse'
            'libappindicator3: Application Indicator support')
options=('!emptydirs')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('258bf6653a840c54ce1b4898d31fb775')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\"python\"/\"python2\"/g' scripts/sokSettings.py

  python2 setup.py install --root=$pkgdir/ --optimize=1
}

package() {
  cd "$pkgdir"

  find . -type f -name *.py | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}
