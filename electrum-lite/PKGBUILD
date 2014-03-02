# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-lite
pkgver=1.9.7
pkgrel=1
pkgdesc="Lightweight Litecoin wallet"
arch=('any')
depends=('python2' 'python2-ecdsa' 'python2-pyqt4' 'python2-sip' 'python2-slowaes' 'qt4' 'sip')
makedepends=('gettext' 'python2-pycurl' 'python2-setuptools')
optdepends=('python2-zbar: QR code reading support'
            'desktop-file-utils: update desktop database')
url="https://electrum-lite.org"
license=('GPL3')
source=(https://electrum-lite.org/Electrum-Lite-1.9.7.tar.gz)
sha256sums=('10a49ef34abd2609067d1a7974e91b3338da08a3a5f03732f00cf64fd5c72ec7')
install=electrum-lite.install

prepare() {
  cd $srcdir/Electrum-Lite-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'

  msg 'Setting electrum.png to electrum-lite.png...'
  find . -type f -print0 | xargs -0 sed -i 's#electrum.png#electrum-lite.png#g'
}

build() {
  cd $srcdir/Electrum-Lite-$pkgver

  msg 'Building...'
  python2 mki18n.py
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
  python2 setup.py build
}

package() {
  cd $srcdir/Electrum-Lite-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
